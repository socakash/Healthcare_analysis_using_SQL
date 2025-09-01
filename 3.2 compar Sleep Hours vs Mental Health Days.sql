SELECT "sleephours", ROUND(AVG("mentalhealthdays"), 1) AS avg_mental
FROM health_dataset
GROUP BY "sleephours"
ORDER BY "sleephours";