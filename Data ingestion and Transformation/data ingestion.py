import pyodbc 
from sqlalchemy import create_engine
from azure.storage.blob import BlobServiceClient
from io import StringIO
import pandas as pd



# Define the connection string
db_connection_string = (
    "Driver={SQL Server};"
    "Server=USER;"
    "Database=coffeeShopDb;"
    "Trusted_Connection=yes;"
)
conn = pyodbc.connect(db_connection_string)

dl_connection_string = (r'connection_string = "DefaultEndpointsProtocol=https;AccountName=coffeeshopstorage;AccountKey=TlIrfddP90/Rb75n4vdnk4TJE31aq3vbji1haWjjnm28algkLc9SkAk03V1TFgt1wMUjTJNiCUBo+AStPVyfLg==;EndpointSuffix=core.windows.net')
blob_service_client = BlobServiceClient.from_connection_string(dl_connection_string)
engine = create_engine('mssql+pyodbc://USER/coffeeShopDb?driver=ODBC+Driver+17+for+SQL+Server&trusted_connection=yes')

tables_csv = ['Customer.csv', 'Generations.csv', 'Inventory.csv', 'Product.csv', 'SalesOutlet.csv', 'SalesTarget.csv', 'staff.csv', 'SalesOrders.csv']
tables_db = ['customer', 'generations', 'inventory', 'product', 'salesOutlet', 'salesTarget', 'staff', 'salesorders']

# Partition size for streaming in rows (e.g., 10,000 rows per chunk)
chunk_size = 10000  

for i in range(len(tables_csv)):
    container_client = blob_service_client.get_container_client(r'coffeeshop/bronze-layer')
    blob_client = container_client.get_blob_client(tables_csv[i])
    
    # Open a new block blob for streaming data
    block_ids = []
    offset = 0

    # Read and upload in chunks
    for chunk in pd.read_sql(f'SELECT * FROM {tables_db[i]}', engine, chunksize=chunk_size):
        file_temp_buffer = StringIO()
        chunk.to_csv(file_temp_buffer, index=False)
        
        # Get the data as a string and encode it
        chunk_data = file_temp_buffer.getvalue().encode('utf-8')
        
        # Generate a unique block ID for each chunk
        block_id = str(offset).zfill(6)
        
        # Stage each chunk as a block
        blob_client.stage_block(block_id=block_id, data=chunk_data)
        block_ids.append(block_id)
        
        # Update the offset for the next block
        offset += 1

    # Commit the blocks to finalize the blob upload
    blob_client.commit_block_list(block_ids)

conn.close()
