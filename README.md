# Coffee Shop Data Engineering Project

## Overview

This project demonstrates a comprehensive data engineering pipeline for a coffee shop chain. The end-to-end solution covers data ingestion, cleaning, transformation, storage, and visualization, leveraging both on-premise and cloud technologies. The project focuses on building a scalable and efficient data architecture using Azure services and other popular data engineering tools.

## Workflow Summary

1. **On-premise Database Design**: 
    - Initially, we designed the database schema for a coffee shop business, capturing data on stores, sales, customers, and products.
    
2. **Data Ingestion to Azure Data Lake Gen2**: 
    - Data was extracted from the on-premise database and loaded into **Azure Data Lake Storage Gen2** using Python’s libraries such **pandas**, **pyodbc** and **azure.storage.blob** . This provided a robust, scalable storage solution for raw data.

3. **Azure Data Factory for Data Pipeline**.

4. **Data Cleaning and Transformation with Databricks**: 
    - **Azure Databricks** was utilized for data cleaning and transformation. The data was processed in two transformation layers:
      - **Raw Layer (bronze)**: Stores unprocessed, raw data from the source systems.
      - **Transformed Layer (silver and gold)**: Cleaned and normalized data ready for analytics and reporting.
    - Both layers were stored in **Azure Data Lake Gen2**.

5. **SQL Pool (Data Warehouse) Design on Azure Synapse**: 
    - After transformation, the cleaned data was loaded into a **Data Warehouse** designed using **Azure Synapse Analytics** (serverless). The data warehouse allowed for efficient querying and analytics using SQL on-demand.

6. **Data Visualization with Power BI**: 
    - The final step was to create business insights and reports using **Power BI**. Dashboards were designed to provide visual insights into store performance, sales trends, and customer demographics, helping decision-makers to make informed choices.

## Project Architecture

The project follows a modern data engineering pipeline architecture:
1. **On-premise Database**: Source of truth for initial data capture.
2. **Azure Data Lake Gen2**: Scalable storage for raw and processed data.
3. **Azure Data Factory**: Automating the data movement.
4. **Azure Databricks**: Data cleaning and transformation using Spark and Python.
5. **Azure Synapse (Serverless)**: A scalable data warehouse for querying transformed data.
6. **Power BI**: For visualization and dashboarding.

## Tools & Technologies

- **On-premise Database**: Designed and maintained as a structured relational database.
- **Python and Pandas**: For loading data to Azure Data Lake Gen2.
- **Azure Data Lake Gen2**: Blob storage for both raw and transformed data.
- **Azure Data Factory**: Data pipeline automation.
- **Azure Databricks**: Apache Spark environment for data processing.
- **Azure Synapse Analytics**: Serverless data warehouse for querying.
- **Power BI**: For building interactive data visualizations and dashboards.

![Architecture Diagram](Images/Overview.png)


![Architecture Diagram](Images/first%20page.png)


![Architecture Diagram](Images/secound%20page.png)
