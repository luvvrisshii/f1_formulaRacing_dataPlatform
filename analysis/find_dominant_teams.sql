-- Databricks notebook source

SELECT team_name, COUNT(*) AS total_races, sum(calculated_points) AS total_points , AVG(calculated_points) AS avg_points FROM f1_processed.race_results_cal GROUP BY team_name HAVING COUNT(*) >=100 ORDER BY avg_points DESC 

-- COMMAND ----------


SELECT team_name, COUNT(*) AS total_races, sum(calculated_points) AS total_points , AVG(calculated_points) AS avg_points FROM f1_processed.race_results_cal WHERE race_year BETWEEN 2011 AND 2020 GROUP BY team_name HAVING COUNT(*) >=50 ORDER BY avg_points DESC 

-- COMMAND ----------


SELECT team_name, COUNT(*) AS total_races, sum(calculated_points) AS total_points , AVG(calculated_points) AS avg_points FROM f1_processed.race_results_cal WHERE race_year BETWEEN 2001 AND 2010 GROUP BY team_name HAVING COUNT(*) >=50 ORDER BY avg_points DESC 

-- COMMAND ----------


