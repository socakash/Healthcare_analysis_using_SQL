SELECT *
FROM health_dataset
WHERE PhysicalHealthDays < 0 OR MentalHealthDays < 0;
