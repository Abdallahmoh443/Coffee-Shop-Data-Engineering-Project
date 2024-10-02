CREATE VIEW dim_customer
AS 
SELECT * FROM
OPENROWSET
(
	BULK 'https://coffeeshopstorage.dfs.core.windows.net/coffeeshop/gold-layer/Customer_Dim.csv',
	DATA_SOURCE = '',
	FORMAT = 'CSV',
	PARSE_VERSION = '2.0',
	HEADER_ROW = TRUE
) AS dim

GO
CREATE VIEW dim_dates
AS 
SELECT * FROM
OPENROWSET
(
	BULK 'https://coffeeshopstorage.dfs.core.windows.net/coffeeshop/gold-layer/Dates_Dim.csv',
	DATA_SOURCE = '',
	FORMAT = 'CSV',
	PARSE_VERSION = '2.0',
	HEADER_ROW = TRUE
) AS dim

GO
CREATE VIEW dim_product
AS 
SELECT * FROM
OPENROWSET
(
	BULK 'https://coffeeshopstorage.dfs.core.windows.net/coffeeshop/gold-layer/Product_Dim.csv',
	DATA_SOURCE = '',
	FORMAT = 'CSV',
	PARSE_VERSION = '2.0',
	HEADER_ROW = TRUE
) AS dim

GO
CREATE VIEW dim_salesoutlet
AS 
SELECT * FROM
OPENROWSET
(
	BULK 'https://coffeeshopstorage.dfs.core.windows.net/coffeeshop/gold-layer/SalesOutlet_Dim.csv',
	DATA_SOURCE = '',
	FORMAT = 'CSV',
	PARSE_VERSION = '2.0',
	HEADER_ROW = TRUE
) AS dim

GO
CREATE VIEW dim_staff
AS 
SELECT * FROM
OPENROWSET
(
	BULK 'https://coffeeshopstorage.dfs.core.windows.net/coffeeshop/gold-layer/Staff_Dim.csv',
	DATA_SOURCE = '',
	FORMAT = 'CSV',
	PARSE_VERSION = '2.0',
	HEADER_ROW = TRUE
) AS dim

GO
CREATE VIEW fact_sales
AS 
SELECT * FROM
OPENROWSET
(
	BULK 'https://coffeeshopstorage.dfs.core.windows.net/coffeeshop/gold-layer/Sales_fact.csv',
	DATA_SOURCE = '',
	FORMAT = 'CSV',
	PARSE_VERSION = '2.0',
	HEADER_ROW = TRUE
) AS fact
