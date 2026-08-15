# Healthcare-Analytics-Project
# Healthcare Analytics Dashboard

## 📊 Project Overview

This project analyzes **5,000 patient records** to provide insights into healthcare utilization, treatment costs, patient recovery, length of stay, and readmission risk.

The project was developed using **SQL for data querying and analysis** and **Power BI for interactive visualization and dashboard development**.

The dashboard is designed from a healthcare management perspective, helping stakeholders understand **where resources are being used, how treatment costs vary across departments, and whether patient outcomes differ by demographic and visit characteristics**. During data cleaning and preparation, a data quality issue was noted. The dataset classified patients into adult age-groups even though it contains a Pediatrics department. The source data does not allow ages to be verified, so a new column was created **standardized_age_group** containing inferred age-group, followed by a data quality flag.

---

## 🎯 Business Problem

Healthcare organizations need to balance **patient outcomes, operational efficiency, and treatment costs**.

Without a consolidated view of patient and departmental data, healthcare managers may struggle to answer questions such as:

* Which departments have the highest treatment costs?
* How does the cost of treatment vary between departments?
* Which departments handle the largest number of patients?
* What proportion of patients in each department arrive through emergency care?
* How does recovery performance vary across different age groups and visit types?
* What is the overall level of patient readmission risk?
* Are there differences in patient outcomes that may warrant further investigation?

This project uses data analysis and visualization to provide a high-level view of these indicators.

---

## 🔎 Key Questions Answered

### Patient Demographics & Utilization

* How many patients are represented in the dataset?
* What is the distribution of patients across age groups?
* What is the gender distribution?
* Which departments treat the largest number of patients?
* How does the patient population change when filtering by gender, age group, department, region, or treatment type?

### Cost & Resource Utilization

* Which departments generate the highest total treatment costs?
* What is the average treatment cost per patient by department?
* Are departments with more patients also associated with higher total treatment costs?

### Emergency Care

* What percentage of patients in each department are associated with emergency visits?
* Which departments have the highest emergency-care proportion?

### Patient Outcomes

* What is the average recovery score?
* How does recovery score vary across age groups?
* Does recovery performance differ between emergency and routine visits?
* Which age groups have the highest and lowest recovery scores?

### Operational Performance

* What is the average patient length of stay?
* What is the overall average readmission risk?
* Which patient segments may require further investigation based on recovery or readmission indicators?

---

## 📌 Key Performance Indicators (KPIs)

| KPI                      |        Result |
| ------------------------ | ------------: |
| Total Patients           |     **5,000** |
| Total Treatment Costs    |      **275M** |
| Average Length of Stay   | **4.06 days** |
| Average Recovery Score   |     **74.72** |
| Average Readmission Risk |      **0.28** |

These KPIs provide a high-level snapshot of **patient volume, financial utilization, operational efficiency, and patient outcomes**.

---

## 📈 Dashboard Visualizations

### 1. Age Group Distribution

Shows the number of patients across different age groups.

**Purpose:**
Understand the demographic composition of the patient population and identify which age groups account for the largest share of patients.

### 2. Gender Distribution

Displays the proportion of male and female patients.

**Purpose:**
Provide a quick overview of the gender composition of the dataset.

### 3. Total Patients by Department

Compares patient volume across healthcare departments.

**Purpose:**
Identify departments handling the largest patient populations and support resource allocation decisions.

### 4. Emergency Proportion by Department

Shows the percentage of patients associated with emergency visits within each department.

**Purpose:**
Highlight departments with relatively higher emergency-care demand.

### 5. Total Treatment Costs by Department

Compares total treatment expenditure across departments.

**Purpose:**
Identify departments contributing most to overall healthcare expenditure.

### 6. Average Treatment Cost per Patient by Department

Shows the average treatment cost for patients within each department.

**Purpose:**
Provide a more normalized cost comparison between departments, reducing the influence of differences in patient volume.

### 7. Recovery Score by Age Group and Visit Type

A matrix comparing average recovery scores across age groups and emergency/routine visit types.

**Purpose:**
Identify differences in recovery outcomes across patient demographics and visit types and highlight segments that may warrant further clinical or operational investigation.

---

## 💡 Key Business Insights

### 1. Orthopedics has the highest total treatment cost

Orthopedics accounts for approximately **58M** in total treatment costs, making it the largest contributor to overall treatment expenditure among the departments shown.

This makes Orthopedics an important area for further investigation into **patient volume, treatment complexity, resource utilization, and cost drivers**.

### 2. Treatment costs remain relatively high across departments

Average treatment cost per patient is relatively similar across departments, ranging from approximately **54K to 56K**.

This suggests that differences in total treatment costs are influenced not only by the cost per patient but also by **the number of patients treated**.

### 3. Emergency-care proportions are relatively consistent

Emergency proportions across departments fall within a relatively narrow range of approximately **31%–33%**.

Cardiology has the highest proportion at approximately **33%**, while several other departments are around **31%–32%**.

This suggests that emergency-care demand is relatively consistent across departments rather than being concentrated in a single department.

### 4. Recovery scores vary across age groups and visit types

The recovery matrix shows differences in average recovery scores across demographic and visit categories.

The **60+ age group has the highest emergency recovery score at 76.17**, while the **46–60 group has the lowest emergency recovery score at 72.78**.

These differences can help stakeholders identify patient segments for deeper analysis.

### 5. Routine visits generally show slightly higher recovery scores

For several age groups, routine visits have recovery scores that are slightly higher than emergency visits.

However, the difference is relatively small and should not be interpreted as evidence that visit type directly causes differences in recovery. Further analysis would be required to account for factors such as **condition severity, treatment type, comorbidities, and patient characteristics**.

---

## 🛠️ Tools & Technologies

### SQL

Used SQL to:

* Query and explore healthcare data
* Aggregate patient and financial metrics
* Calculate departmental statistics
* Analyze treatment costs
* Calculate patient and visit-level measures
* Prepare data for visualization
* Support KPI development

### Power BI

Used Power BI to:

* Build an interactive healthcare dashboard
* Create KPI cards
* Develop departmental and demographic visualizations
* Build a recovery-score matrix
* Implement interactive slicers
* Compare patient segments
* Present findings in a stakeholder-friendly format

### Data Analysis Concepts

* Data aggregation
* Descriptive analytics
* KPI development
* Patient segmentation
* Cost analysis
* Demographic analysis
* Healthcare utilization analysis
* Outcome analysis
* Comparative analysis
* Interactive data visualization

---

## 🎨 Dashboard Interactivity

The dashboard includes slicers for:

* **Gender**
* **Age Group**
* **Department**
* **Region**
* **Treatment Type**

These filters allow stakeholders to move from a high-level overview to more specific patient segments and investigate how key metrics change across different populations.

---

## Age Group Data Quality

The dataset does not contain individual patient ages and provides only four adult age groups (18–30, 31–45, 46–60, and 60+), despite including a Pediatrics department. Because the source data does not allow the pediatric ages to be verified, Pediatrics records were analytically classified as 0–17 based on the department designation. The original **age_group** field was retained, while a separate **standardized_age_group** field was used for age-related analysis. This classification is an analytical assumption rather than a verified patient age. For transparency, a data quality flag was created, **age_group_quality_flag** to highlight the **standardized_age_group** column contains inferred rather then verified age for **Pediatric** patients.

---

## 📊 Analytical Approach

The project followed an end-to-end analytics workflow:

```text
Healthcare Dataset
       ↓
Data Exploration & Preparation
       ↓
SQL Analysis & Aggregation
       ↓
KPI Development
       ↓
Power BI Data Modeling
       ↓
Interactive Visualizations
       ↓
Business Insights
       ↓
Stakeholder Decision Support
```

The focus was not only on creating visualizations, but on connecting each visualization to a **specific business question**.

---

## 🧠 Skills Demonstrated

This project demonstrates practical experience in:

* **SQL querying**
* **Data aggregation and analysis**
* **Healthcare analytics**
* **Data quality and consistency**
* **Power BI dashboard development**
* **Data visualization**
* **KPI design**
* **Business intelligence**
* **Patient segmentation**
* **Cost and utilization analysis**
* **Descriptive analytics**
* **Interactive dashboard design**
* **Translating data into business insights**
* **Stakeholder-focused data storytelling**

---

## ⚠️ Important Analytical Consideration

The dashboard provides **descriptive insights rather than causal conclusions**.

Answering age related questions, the **standardized_age_group** was used to provide a more logical interpretable result. However the original **age_group** column was retained.

For example, differences in recovery scores between emergency and routine visits do not necessarily mean that the visit type itself caused the difference. Additional clinical and patient-level variables would be required to determine the underlying drivers.

Similarly, higher departmental spending should be interpreted alongside patient volume, treatment complexity, length of stay, and other resource-utilization factors.

---

## 🚀 Future Improvements

Potential extensions to this project include:

* Adding monthly or yearly treatment-cost trends
* Analyzing readmission risk by department and patient segment
* Investigating the relationship between length of stay and treatment cost
* Adding treatment-level cost analysis
* Investigating factors associated with lower recovery scores
* Adding drill-through pages for individual departments
* Introducing additional clinical and operational KPIs

---

## 📌 Project Summary

This project demonstrates how **SQL and Power BI can be combined to transform healthcare data into actionable business intelligence**.

The analysis provides visibility into patient demographics, departmental activity, treatment expenditure, emergency-care utilization, recovery outcomes, and readmission risk.

Rather than focusing solely on visualization, the project connects **data → analysis → business questions → insights → decision support**, demonstrating an end-to-end approach to healthcare analytics.

