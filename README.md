# 🎓 End-to-End Global Student Career & Education Analysis ( Python → SQL)

This project demonstrates a complete data analytics workflow — from raw student data cleaning and exploration in Python, through advanced SQL-based analysis to uncover global education, scholarship, placement, and salary trends.  

## 🧰 Tools & Technologies Used

- **Data Source**: `global_student_data.csv` (curated dataset)  
- **Data Cleaning & Transformation**: Python (Pandas, NumPy)  
- **Data Analysis**: SQL (Window Functions, CTEs, Aggregations, Subqueries)  
- **Visualization**: Matplotlib  

## 📌 Project Workflow

### 🔹 Step 1: Data Collection & Cleaning (Python)

- Imported raw student data using `pandas`  
- Handled:  
  - Missing values  
  - Incorrect data types (e.g., date conversions)  
  - Standardized categorical values (e.g., `scholarship_received`, `placement_status`)  
- Generated new columns like study_duration,education_type 
👉 Refer to [`global_student_analysis.ipynb`](./global_student_analysis.ipynb)  

---

### 🔹 Step 2: SQL Analysis

Performed structured analysis using SQL queries, including:  

#### ✅ Education & Scholarship Insights
- Universities with most popular education types  
- Students with scholarships vs placements  
- Top universities & fields of study by country  

#### ✅ Placement & Career Trends
- Placement rate trends over enrollment years  
- Top companies hiring students across countries  
- Placement company dominance by country  

#### ✅ Salary & Growth Analysis
- Students earning above their field’s average salary  
- Highest and lowest salary distribution per company  
- Salary categorization (Low, Medium, High)  
- Scholarship impact on placement success  

👉 Refer to:  
- [`SQLQuery.sql`](./SQLQuery.sql) — Education, Scholarship & Placement Analysis  
- [`SQL_analysis.sql`](./SQL_analysis.sql) — Salary, Scholarship Impact & Company Trends  

---

### 🔹 Step 3: Exploratory Data Analysis (Python)

Used **Matplotlib** for visualization:  
- Placement success rate vs year of enrollment  
- Salary distribution by field of study  
- Scholarship vs placement outcome comparison  
- Country-wise placement company counts  

---
## 🔍 Key Insights

- 🎓 Certain universities dominate in specific **fields of study** and destination countries.  
- 💰 Students with **scholarships** had a higher placement success rate, but not universally.  
- 📈 Placement rates improved over the years, with some fluctuations by region.  
- 🏢 A few companies were **top recruiters globally**, while some countries had more diverse hiring patterns.  
- 💸 Many students earned salaries **above their field’s average**, suggesting strong job readiness in those areas.  
- 📊 Most placed students fall in the **Medium (40k–90k USD)** salary range.  

---

## 📁 Files in This Repository

| File Name                              | Description                                                       |
|----------------------------------------|-------------------------------------------------------------------|
| [`global_student_data.csv`](./global_student_data.csv) | Dataset used for analysis                               |
| [`global_student_analysis.ipynb`](./global_student_analysis.ipynb) | Jupyter Notebook for cleaning, EDA & visualization |
| [`SQLQuery.sql`](./SQLQuery.sql)       | SQL queries on education, scholarships & placements                |
| [`SQL_analysis.sql`](./SQL_analysis.sql) | SQL queries on salary, scholarship impact & companies             |
| [`README.md`](./README.md)             | Project overview and documentation                                |

---

## ✅ Conclusion

This project showcases **end-to-end student data analysis** using Python and SQL. It demonstrates skills in:  
- Data Cleaning & Preprocessing  
- Advanced SQL (CTEs, Window Functions, Aggregations, Subqueries)  
- Exploratory Data Analysis with Python  
- Business insight generation from global education and placement trends  


