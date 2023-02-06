-- Databricks notebook source
CREATE OR REPLACE TEMPORARY VIEW v_dominant_team
AS
SELECT
  Rank() OVER(ORDER BY AVG(calculated_points) DESC) team_rank,
  team_name,
  COUNT(*) AS total_races,
  sum(calculated_points) AS total_points,
  AVG(calculated_points) AS avg_points
FROM
  f1_processed.race_results_cal
GROUP BY
  team_name
HAVING
  COUNT(*) >= 100
ORDER BY
  avg_points DESC

-- COMMAND ----------

--Info realted to drivers
SELECT
  race_year,
  team_name,
  COUNT(*) AS total_races,
  sum(calculated_points) AS total_points,
  AVG(calculated_points) AS avg_points
FROM
  f1_processed.race_results_cal
  WHERE team_name IN(SELECT team_name FROM  v_dominant_team WHERE team_rank <=5)
GROUP BY
  race_year, team_name
ORDER BY
 race_year, avg_points DESC

-- COMMAND ----------


