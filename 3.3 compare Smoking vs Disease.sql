SELECT "smokerstatus",
       ROUND(100.0 * SUM(CASE WHEN "hadheartattack"='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS heart_attack_pct
FROM health_dataset
GROUP BY "smokerstatus";
