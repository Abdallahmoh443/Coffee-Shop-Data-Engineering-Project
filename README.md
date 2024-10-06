#Coffee Shop Data Engineering Project


#Overview

This project demonstrates a comprehensive data engineering pipeline for a coffee shop chain. The end-to-end solution covers data ingestion, cleaning, transformation, storage, and visualization, leveraging both on-premise and cloud technologies. The project focuses on building a scalable and efficient data architecture using Azure services and other popular data engineering tools.

Workflow Summary
On-premise Database Design:

Initially, we designed the database schema for a coffee shop business, capturing data on stores, sales, customers, and products.
Data Ingestion to Azure Data Lake Gen2:

Data was extracted from the on-premise database and loaded into Azure Data Lake Storage Gen2 using Python’s pandas library. This provided a robust, scalable storage solution for raw data.
Azure Data Factory for Data Pipeline:

Azure Data Factory (ADF) was used to orchestrate and automate the data ingestion process. ADF pipelines were created to move data from the on-premise database to the Azure Data Lake.
Data Cleaning and Transformation with Databricks:

Azure Databricks was utilized for data cleaning and transformation. The data was processed in two transformation layers:
Raw Layer: Stores unprocessed, raw data from the source systems.
Transformed Layer: Cleaned and normalized data ready for analytics and reporting.
Both layers were stored in Azure Data Lake Gen2.
Data Warehouse Design on Azure Synapse:

After transformation, the cleaned data was loaded into a Data Warehouse designed using Azure Synapse Analytics (serverless). The data warehouse allowed for efficient querying and analytics using SQL on-demand.
Data Visualization with Power BI:

The final step was to create business insights and reports using Power BI. Dashboards were designed to provide visual insights into store performance, sales trends, and customer demographics, helping decision-makers to make informed choices.
Project Architecture
The project follows a modern data engineering pipeline architecture:

On-premise Database: Source of truth for initial data capture.
Azure Data Lake Gen2: Scalable storage for raw and processed data.
Azure Data Factory: Orchestrating and automating the data movement between on-prem and cloud.
Azure Databricks: Data cleaning and transformation using Spark and Python.
Azure Synapse (Serverless): A scalable data warehouse for querying transformed data.
Power BI: For visualization and dashboarding.
Tools & Technologies
On-premise Database: Designed and maintained as a structured relational database.
Python and Pandas: For loading data to Azure Data Lake Gen2.
Azure Data Lake Gen2: Blob storage for both raw and transformed data.
Azure Data Factory: Data pipeline automation.
Azure Databricks: Apache Spark environment for data processing.
Azure Synapse Analytics: Serverless data warehouse for querying.
Power BI: For building interactive data visualizations and dashboards.
