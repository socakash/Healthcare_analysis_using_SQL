SELECT State, Sex, COUNT(*) AS population
FROM health_dataset
GROUP BY State, Sex
ORDER BY population DESC;