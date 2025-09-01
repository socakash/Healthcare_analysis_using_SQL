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

<img width="482" height="665" alt="image" src="https://github.com/user-attachments/assets/8628d401-56dc-4c7e-b658-5141f61b88d7" />


2. Lifestyle & Health Correlations
Impact of physical activity on physical health
Sleep hours vs mental health days
Smoking status vs heart attack prevalence

sql
SELECT "Sleep Hours", AVG("Mental Health Days") AS avg_mental
FROM health_dataset
GROUP BY "Sleep Hours"
ORDER BY "Sleep Hours";

<img width="527" height="680" alt="image" src="https://github.com/user-attachments/assets/48430657-5310-4073-acbc-78a2b731fcc9" />

3. Chronic Disease Insights
- Smoking status vs heart attack prevalence
- Multi-condition cases (patients with both diabetes & heart disease)

sql
SELECT "smokerstatus",
       ROUND(100.0 * SUM(CASE WHEN "hadheartattack"='Yes' THEN 1 ELSE 0 END)/COUNT(*),2) AS heart_attack_pct
FROM health_dataset
GROUP BY "smokerstatus";

<img width="475" height="298" alt="image" src="https://github.com/user-attachments/assets/ff45a9c9-ec13-4494-b7fd-a34d3eab9d90" />

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

<img width="340" height="212" alt="image" src="https://github.com/user-attachments/assets/eb59b307-dcdf-4f70-95dd-6247b2196c54" />


---



