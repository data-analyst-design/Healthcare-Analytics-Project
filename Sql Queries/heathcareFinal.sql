-- Preview the dataset
SELECT *
FROM healthcare
LIMIT 10;


--****** Data Cleaning and Transformation *******
--Check for duplicates
WITH duplicates AS (
	SELECT *,
		ROW_NUMBER() OVER(PARTITION BY visit_date,age_group, gender, region, department, treatment_type 
			ORDER BY patient_id) AS row_n
	FROM healthcare
)
SELECT *
FROM duplicates
WHERE row_n > 1;


--****Add two columns i.e date_visited and time_visited*****
-- Extract the date and time from visit_date
ALTER TABLE healthcare
	ADD COLUMN IF NOT EXISTS date_visited DATE,
	ADD COLUMN IF NOT EXISTS time_visited TIME;

UPDATE healthcare
SET date_visited = visit_date::DATE;

UPDATE healthcare
SET time_visited = visit_date::TIME;

--***** Add new col of age_group and change age_group of all Peaditric patients to 0-18 ******--
-- Create a new column, standardized_age_group to help infer Pediatric patients' age group based on an analytical assumption
ALTER TABLE healthcare
ADD COLUMN IF NOT EXISTS standardized_age_group TEXT;

UPDATE healthcare
SET standardized_age_group = CASE WHEN department = 'Pediatrics' THEN '0-18'
						ELSE age_group END;

--****** Create a data quality flag ******
-- Follow up with a quality flag
ALTER TABLE healthcare
ADD COLUMN IF NOT EXISTS age_group_quality_flag TEXT;

-- Update the col
UPDATE healthcare
SET age_group_quality_flag = CASE WHEN department = 'Pediatrics' AND age_group IN ('18-30','31-45','46-60','60+')
								THEN 'Inferred as 0-18 - Pediatrics'
								ELSE 'Original age group' END;



-- ****** Start EDA *******
--Total number of patients
SELECT COUNT(*)
FROM healthcare;

--How frequent does each age_group seek medical services
SELECT standardized_age_group,
	COUNT(*) AS number_of_visits
FROM healthcare
GROUP BY standardized_age_group
ORDER BY number_of_visits DESC;


--which gender recorded the most visits
SELECT gender,
	COUNT(*) AS number_of_visits
FROM healthcare
GROUP BY gender
ORDER BY number_of_visits DESC;

--Which department had the most number of patients
SELECT department,
	COUNT(*) AS number_of_patients
FROM healthcare
GROUP BY department
ORDER BY number_of_patients DESC;

--Which departments handle the highest proportion of emergency visits
WITH visit_counts AS (
	SELECT department,
		COUNT(*) AS total_visits,
		COUNT(CASE WHEN visit_type = 'Emergency' THEN 1 END) AS emergency_visits
	FROM healthcare
	GROUP BY department
)
SELECT *,
	ROUND((emergency_visits::numeric / total_visits) * 100, 2) AS proportion_of_emergencies
FROM visit_counts
ORDER BY proportion_of_emergencies DESC;


-- Which departments have the longest average length of stay
SELECT department,
	ROUND(AVG(length_of_stay_days)::numeric, 2) AS avg_length_of_stay
FROM healthcare
GROUP BY department
ORDER BY avg_length_of_stay DESC;


-- Which departments generate the highest treatment_costs
-- i.e the high treatment costs could be volume based
SELECT department,
	SUM(treatment_cost) AS total_treatment_cost
FROM healthcare
GROUP BY department
ORDER BY total_treatment_cost DESC;
	
-- Which departments generate the highest AVERAGE treatment_costs
-- i.e the average cost of treatment per patient
SELECT department,
	ROUND(AVG(treatment_cost), 2) AS avg_treatment_cost
FROM healthcare
GROUP BY department
ORDER BY avg_treatment_cost DESC;

-- Which department achieves the highest average recovery score
SELECT department,
	ROUND(AVG(recovery_score), 2) AS avg_recovery_score
FROM healthcare
GROUP BY department
ORDER BY avg_recovery_score DESC;

-- Which age_group achieves the highest average recovery score
SELECT standardized_age_group,
	ROUND(AVG(recovery_score), 2) AS avg_recovery_score
FROM healthcare
GROUP BY standardized_age_group
ORDER BY avg_recovery_score DESC;

-- Which department is associated with high readmission risk
SELECT department,
	ROUND(AVG(readmission_risk)::numeric, 3) AS avg_readmission_risk
FROM healthcare
GROUP BY department
ORDER BY avg_readmission_risk DESC;

