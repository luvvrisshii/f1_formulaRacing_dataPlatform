-- Databricks notebook source
--sum cal_points per r drier and rank them based on theri sum
SELECT driver_name, COUNT(*) AS total_races, sum(calculated_points) AS total_points , AVG(calculated_points) AS avg_points FROM f1_processed.race_results_cal WHERE race_year BETWEEN 2011 AND 2020 GROUP BY driver_name HAVING COUNT(*) >=50 ORDER BY avg_points DESC 

-- COMMAND ----------

--sum cal_points per r drier and rank them based on theri sum
SELECT driver_name, COUNT(*) AS total_races, sum(calculated_points) AS total_points , AVG(calculated_points) AS avg_points FROM f1_processed.race_results_cal  GROUP BY driver_name HAVING COUNT(*) >=50 ORDER BY avg_points DESC 

-- COMMAND ----------


