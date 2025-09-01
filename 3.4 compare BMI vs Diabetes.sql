SELECT
    CASE
        WHEN "bmi" < 18.5 THEN 'Underweight'
        WHEN "bmi" >= 18.5 AND "bmi" <= 24.9 THEN 'Normal'
        WHEN "bmi" >= 25   AND "bmi" <= 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END AS bmi_category,

ROUND(100.0 * SUM(CASE WHEN "haddiabetes" = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),2) AS Percent_diabetes

FROM health_dataset
GROUP BY bmi_category
ORDER BY Percent_diabetes DESC;