# Difference between Data Warehouse and Lakehouse

| Point | Data Warehouse | Lakehouse |
|-------|----------------|-----------|
| **Definition** | Central store of cleaned, structured data for analytics | Data lake storage with warehouse features on top |
| **Data types** | Structured, some semi-structured (JSON) | Structured, semi-structured and unstructured (images, logs, audio) |
| **Schema** | Schema-on-write (defined before loading) | Schema-on-read and schema-on-write both supported |
| **Storage** | Proprietary or internal format | Open formats (Delta, Parquet, Iceberg) on cloud storage (S3, ADLS) |
| **Processing approach** | Usually ETL (transform before load) | Usually ELT (load raw, then transform) |
| **Languages** | Mainly SQL | SQL, Python, Scala, R |
| **Cost** | Higher storage and compute cost | Cheaper storage, pay for compute when used |
| **Raw data** | Usually not kept | Kept in the raw (bronze) layer |
| **Data quality and ACID** | Strong, built in | Provided by the table format (e.g., Delta Lake) |
| **Typical users** | Analysts, BI developers | Data engineers, data scientists, ML engineers |
| **Best for** | Reporting, dashboards, BI | Big data engineering, ML and AI, mixed workloads |
| **Examples** | Snowflake, Oracle, Teradata, Redshift | Databricks, Apache Iceberg, Microsoft Fabric |
| **Layers** | Staging, then warehouse tables | Bronze (raw), Silver (cleansed), Gold (curated) |