# Healthcare_analysis_using_SQL
This project analyzes a healthcare dataset using SQL queries to uncover insights into population health, chronic diseases, lifestyle habits, preventive care, and high-risk groups.   The goal is to demonstrate how structured query analysis can generate meaningful findings that support public health decisions.

# 🏥 Healthcare Data Analysis with SQL (PostgreSQL)

## 📌 Project Overview
This project analyzes a healthcare dataset using **PostgreSQL** queries to uncover insights into **population health, chronic diseases, lifestyle habits, preventive care, and high-risk groups**.  
The goal is to demonstrate how structured query analysis can generate meaningful findings that support public health decisions.

---

## ⚙️ Tech Stack
- **Database:** PostgreSQL 17
- **IDE:** VS Code with SQL extensions
- **Language:** SQL

---

## 📂 Dataset Columns
Key attributes in the dataset:
- **Demographics:** State, Sex, Age Category, Race/Ethnicity  
- **Health Status:** General Health, Physical/Mental Health Days, BMI  
- **Lifestyle:** Physical Activities, Sleep Hours, Smoker Status, Alcohol Drinkers, ECigarette Usage  
- **Medical History:** Diabetes, Heart Attack, Stroke, COPD, Asthma, Arthritis, Cancer  
- **Disabilities:** Hearing, Vision, Walking, Concentrating, Daily Tasks  
- **Preventive Care:** Last Checkup, Flu/Pneumo/Tetanus Vaccines, HIV Testing, Chest Scan  
- **COVID:** Positive History, High Risk Indicator  

---

## 🔍 Analysis Roadmap

### 1. Demographics & General Health
1. Population by state and sex  
- Distribution of general health status  
- Average physical and mental health days  

```sql
SELECT State, Sex, COUNT(*) AS population
FROM health_dataset
GROUP BY State, Sex
ORDER BY population DESC;


2. Lifestyle & Health Correlations
Impact of physical activity on physical health
Sleep hours vs mental health days
Smoking status vs heart attack prevalence

sql
SELECT "Sleep Hours", AVG("Mental Health Days") AS avg_mental
FROM health_dataset
GROUP BY "Sleep Hours"
ORDER BY "Sleep Hours";


3. Chronic Disease Insights
- Smoking status vs heart attack prevalence
- Multi-condition cases (patients with both diabetes & heart disease)

sql
SELECT "smokerstatus",
       ROUND(100.0 * SUM(CASE WHEN "hadheartattack"='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS heart_attack_pct
FROM health_dataset
GROUP BY "smokerstatus";


4. Preventive Care
BMI categories vs diabetes risk

sql
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



---



