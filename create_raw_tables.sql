-- Databricks notebook source
CREATE DATABASE IF NOT EXISTS f1_raw;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #### Circuit Table

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS f1_raw.circuits(
circuitId INT,
cicuitRef STRING,
name STRING,
location STRING,
country STRING,
lat DOUBLE,
lng DOUBLE,
alt INT,
url STRING
)
USING csv
OPTIONS (path "/mnt/formula1dl783/raw/circuits.csv")

-- COMMAND ----------

SELECT * FROM f1_raw.circuits;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ##### Races Table

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS f1_raw.races(
raceid INT,
year INT,
round INT,
circuitId INT,
name STRING,
date DATE,
time STRING,
url STRING
)
USING csv
OPTIONS (path "/mnt/formula1dl783/raw/races.csv")

-- COMMAND ----------

SELECT * FROM f1_raw.races;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC #### JSON Tables

-- COMMAND ----------

--constructor table
DROP TABLE IF EXISTS f1_raw.constructor;
CREATE TABLE IF NOT EXISTS f1_raw.constructor(
constructorId INT ,
constructorRef STRING, 
name STRING, 
nationality STRING,
url STRING
)
USING json
OPTIONS(path "/mnt/formula1dl783/raw/constructors.json") 

-- COMMAND ----------

SELECT * FROM f1_raw.constructor

-- COMMAND ----------

-- MAGIC %fs
-- MAGIC ls /mnt/formula1dl783/processed

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ##### Driver_Table with complex 

-- COMMAND ----------

DROP TABLE IF EXISTS f1_raw.driver;
CREATE TABLE IF NOT EXISTS f1_raw.driver(
driverId INT,
driverRef STRING,
number INT,
code STRING,
name STRUCT<forename:STRING, surname:STRING>,
dob DATE,
nationality STRING,
url String
)
USING json
OPTIONS (path "/mnt/formula1dl783/raw/drivers.json")

-- COMMAND ----------

SELECT * FROM f1_raw.driver

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ##### Results Table

-- COMMAND ----------

DROP TABLE IF EXISTS f1_raw.results;
CREATE TABLE IF NOT EXISTS f1_raw.results (
resultId INT,
raceId INT,
driverId INT,
constructorId INT,
number INT,
grid INT,
position INT,
positionText STRING,
positionOrder INT,
points INT,
laps STRING,
time INT,
milliseconds INT,
fastestLap INT,
rank INT,
fastestLapTime STRING,
fastestLapSpeed FLOAT,
statusId STRING
)
USING json
OPTIONS(PATH "/mnt/formula1dl783/raw/results.json")

-- COMMAND ----------

SELECT * FROM f1_raw.results

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ##### PitSpot Table

-- COMMAND ----------

DROP TABLE IF EXISTS f1_raw.pit_stops;
CREATE TABLE IF NOT EXISTS f1_raw.pit_stops(
driverId INT,
duration STRING,
lap INT,
milliseconds INT,
raceId INT,
stop STRING,
time STRING
)
using json
OPTIONS(path "/mnt/formula1dl783/raw/pit_stops.json", multiline true)


-- COMMAND ----------

SELECT * FROM f1_raw.pit_stops

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ##### Lap and Qualifying

-- COMMAND ----------

DROP TABLE IF EXISTS f1_raw.lap;
CREATE TABLE IF NOT EXISTS f1_raw.lap (
driverId INT,
raceId INT,
lap INT,
position INT,
time STRING,
milliseconds INT
)
using csv
OPTIONS(path "/mnt/formula1dl783/raw/lap_times")

-- COMMAND ----------

SELECT * FROM f1_raw.lap

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ###### Qualifying

-- COMMAND ----------

DROP TABLE IF EXISTS f1_raw.qualifying;
CREATE TABLE IF NOT EXISTS f1_raw.qualifying (
qualifyId INT,
raceId INT,
driverId INT,
constructorId INT,
number INT,
position INT,
q1 STRING,
q2 STRING,
q3 STRING
)
using json
OPTIONS(path "/mnt/formula1dl783/raw/qualifying", multiline True)

-- COMMAND ----------

SELECT * FROM f1_raw.qualifying

-- COMMAND ----------


