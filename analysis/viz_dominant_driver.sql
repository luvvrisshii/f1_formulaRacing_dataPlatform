-- Databricks notebook source
SELECT
  Rank() OVER(ORDER BY AVG(calculated_points) DESC) rank,
  driver_name,
  COUNT(*) AS total_races,
  sum(calculated_points) AS total_points,
  AVG(calculated_points) AS avg_points
FROM
  f1_processed.race_results_cal
GROUP BY
  driver_name
HAVING
  COUNT(*) >= 50
ORDER BY
  avg_points DESC

-- COMMAND ----------

CREATE OR REPLACE TEMPORARY VIEW v_dominant_drivers
AS
SELECT
  Rank() OVER(ORDER BY AVG(calculated_points) DESC) driver_rank,
  driver_name,
  COUNT(*) AS total_races,
  sum(calculated_points) AS total_points,
  AVG(calculated_points) AS avg_points
FROM
  f1_processed.race_results_cal
GROUP BY
  driver_name
HAVING
  COUNT(*) >= 50
ORDER BY
  avg_points DESC

-- COMMAND ----------

SHOW TABLES FROM
f1_processed;

-- COMMAND ----------

--Info realted to drivers
SELECT
  race_year,
  driver_name,
  COUNT(*) AS total_races,
  sum(calculated_points) AS total_points,
  AVG(calculated_points) AS avg_points
FROM
  f1_processed.race_results_cal
  WHERE driver_name IN(SELECT driver_name FROM  v_dominant_drivers WHERE driver_rank <=10)
GROUP BY
  race_year, driver_name
ORDER BY
 race_year, avg_points DESC

-- COMMAND ----------


