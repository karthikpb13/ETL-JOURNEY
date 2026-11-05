1)  In an ETL project, the first time data is loaded into the target table, 5,000 records are loaded. 
    Later, an incremental load adds another 500 records, so the target now has 5,500 records. 
    The source now has 6,000 records. The team then deletes all the data from the target table and reloads all 6,000 records from the source.
    What is this load called? And what type of load will run after it?
Answer:
    The delete-and-reload of all 6,000 records is called a Full Refresh (also known as a Full Reload or Truncate and Load).
    The loads after that go back to Incremental (Delta) Load.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
Why we are storing the data in s3
--> Upstream Testing
--> Data Retention Policy ( Till 6 months ) 
--> After 6 months data will be moved to 

# Storage Classes of AWS S3

## Typical Lifecycle for Raw Data

1. **Day 0-30: S3 Standard**
   Just landed, being processed and validated.

2. **After 30 days: S3 Standard-IA**
   Occasional reprocessing.

3. **After 90 days: S3 Glacier Flexible Retrieval**
   Rarely accessed, cheaper storage.

4. **After 180+ days: S3 Glacier Deep Archive**
   Long-term retention, optionally with an expiry rule after the retention period ends.

# Storage Tiers of ADLS Gen2

## 1. Hot
- **Best for:** Frequently accessed data (active processing, analytics)
- **Min. duration:** None
- **Access:** Instant
- **Storage cost:** Highest
- **Access cost:** Lowest

## 2. Cool
- **Best for:** Infrequently accessed data (short-term backups, older data)
- **Min. duration:** 30 days
- **Access:** Instant
- **Storage cost:** Lower
- **Access cost:** Higher

## 3. Cold
- **Best for:** Rarely accessed data that still needs instant reads
- **Min. duration:** 90 days
- **Access:** Instant
- **Storage cost:** Lower than Cool
- **Access cost:** Higher than Cool

## 4. Archive
- **Best for:** Long-term retention, compliance, raw history
- **Min. duration:** 180 days
- **Access:** Offline (data must be rehydrated before it can be read, which can take hours)
- **Storage cost:** Lowest
- **Access cost:** Highest			Offline, needs rehydration	Lowest				Highest

Then S3 contains all type of data and from s3 only the data present in accurate format , Naming Conventions will move to RAW folder

When data moving from s3 to RAW
--> Only the required data will be moved to RAW data 
--> RAW folder contains the data in original format 
--> And from RAW data will be moved to Cleansed folder 


When Data Moving from RAW to CLEANSED
--> Data will be cleansed
--> Data will be converted in standard format 
--> Unwanted Spaces will be removed
--> Necessary case will be applied
--> Audit Columns will be applied (Like Batch_id, load_timestamp, is_active)
--> And then for further processing data will be moved from CLEANSED TO CURRATED


Moving From CLEANSED TO CURATED 
--> All the necessary Transformations will be applied
--> Transformations will be applied according to business requirements
--> Transformations Like sales_month, Sales_Product_Category, Sales_by_Month, Sales_Customer


Pipeline Folders
--> S3-To-Raw Ingestion
	--> product_raw_data_ingestion 
	--> customer_raw_data_ingestion
	--> orders_raw_data_ingestion

--> Raw-to-Cleansed
	--> product_cleansed_data_pipeline
	--> customer_cleansed_data_pipeline
	--> orders_cleansed_data_pipeline

--> Cleansed-to-curated
	--> curated_sales_executive_summary
	--> curated_sales_product
	--> curated_sales_product_category
	--> curated_sales_by_month
	--> curated_sales_by_customer

--> Curated-to-Snowflake
	--> SF_sales_Executive_Summary
	--> SF_sales_by_product
	--> SF_sales_product_category
	--> SF_sales_by_month
	--> SF_sales_by_customer

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# What is a Data Flow in ADF?

A data flow in Azure Data Factory is a visual, code-free transformation feature that lets you design data transformation logic (such as filter, join, aggregate and derive columns) on a graphical canvas. ADF converts the design into Spark code and executes it on a managed Spark cluster, reading from source datasets and writing the transformed result to sink datasets.

A data flow in ADF is a GUI-based way to build data transformations at scale. You define a source, apply transformations, and write to a sink, and ADF runs it on a managed Spark cluster without you writing any code.


# Types of Data Flows in ADF

## 1. Mapping Data Flow
- **Purpose:** Visual, code-free transformations at scale (source → transformations → sink)
- **Engine:** Managed Spark cluster

## 2. Wrangling Data Flow
- **Purpose:** Power Query-style data preparation with a spreadsheet-like UI
- **Engine:** Power Query Online, translated to Spark


------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------

Validations done at each part
s3 to bronze
--> Verify Root folder structure 
--> verify that file is moved from s3 to adls bronze
--> Verify s3 to row pipeline execution 
--> Verify file is not empty in bronze layer
--> Verify column counts in bronze
--> Verify record counts between bronze and s3
--> Verify Duplicate records between s3 and bronze

RAW to CLEANSED
--> Verify raw to cleansed pipeline execution
--> Verify source raw file is oved to archive
--> Verify column count between raw to cleansed
--> verify record count between raw to cleansed
--> verify removal of white space 
--> Verify the decoding
--> Verify Phone number updation
--> Verify for duplicates
--> Product file contains only the products whose price greater than one null check


Silver to gold
--> Validate the pipeline
--> validate the business need
--> validate total revenue calculation
--> verify total number of orders
--> verify total qty sold
--> verify most valuable order
--> Verify product wise total revenue calculation
--> verify the total units sold by product wise
--> verify product wise average selling price 
--> verify category wise total revenue


what is the diffrence between snowflake and datbricks 
| Feature  | Snowflake                    | Databricks                          |
|----------|------------------------------|-------------------------------------|
| Type     | Data warehouse               | Lakehouse                           |
| Language | SQL-first, SQL-native        | Python, SQL, Scala (Spark)          |
| Data     | Structured + semi-structured | Structured, semi + unstructured     |
| Storage  | Snowflake's own format       | Open Delta tables on your cloud     |
| Best for | Reporting / BI               | ML, AI, big data engineering        |