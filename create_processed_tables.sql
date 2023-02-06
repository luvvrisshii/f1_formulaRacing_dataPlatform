-- Databricks notebook source
-- MAGIC %md
-- MAGIC ##### We would create External Tables in this notebook
-- MAGIC ###### Table naming - f1.processed_name

-- COMMAND ----------

--We know wew can create external table either through python or SQL Syntax

-- COMMAND ----------

CREATE DATABASE IF NOT EXISTS f1_processed
LOCATION "/mnt/formula1dl783/processed"

-- COMMAND ----------

--WE will be creating table using Pyspark
--So What we did is, we went to our ingested folders, and write the output as Tabels in parquet format.

-- COMMAND ----------

-- MAGIC %fs
-- MAGIC ls /mnt/formula1dl783/processed

-- COMMAND ----------


