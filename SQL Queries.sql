

--1.Total Admissions
SELECT
	patient_id,
	COUNT(*) AS total_admissions
FROM admissions
GROUP BY patient_id 
ORDER BY total_admissions DESC;




--2.Unique patinet
SELECT	COUNT(DISTINCT patient_id)
FROM admissions;




--3.Top Diagnosis
SELECT
	ir.diagnosis,
	COUNT(*) AS total_cases
FROM admissions a
JOIN icd_reference ir 
	ON a.icd_code = ir.icd_code
GROUP BY ir.diagnosis
ORDER BY total_cases DESC
LIMIT 3;





--4.Top Department
SELECT
	department,
	COUNT(*) AS total_patients
FROM admissions
GROUP BY department
ORDER BY total_patients DESC;




--5.Higest Cost Patient
SELECT
	DISTINCT p.patient_name,
	SUM(a.treatment_cost) AS total_treatment_cost
FROM patients p
JOIN admissions a
	ON p.patient_id = a.patient_id
GROUP BY p.patient_name
ORDER BY total_treatment_cost  DESC;




--Avg treatment ocst by diagnosis
SELECT
	ir.diagnosis,
	ROUND(AVG(a.treatment_cost),2) AS avg_treatment_cost
FROM icd_reference ir
JOIN admissions a
	ON ir.icd_code = a.icd_code
GROUP BY ir.diagnosis
ORDER BY avg_treatment_cost DESC;




--6.Early Readmission
SELECT 
	p.patient_id,
	p.patient_name,
	p.age,
	COUNT(a.admission_id) AS total_admissions
FROM patients p
JOIN admissions a
	ON p.patient_id = a.patient_id 
WHERE p.age > 60
GROUP BY p.patient_id,
	p.patient_name,
	p.age
HAVING COUNT(a.admission_id) > 1
ORDER BY total_admissions DESC;




--7.Avg length of stay
SELECT
	AVG(discharge_date - admit_date) AS avg_los
FROM admissions;




--8.Cost per day Analysis
SELECT 	
	patient_id,
	treatment_cost,
	discharge_date - admit_date AS los,
	treatment_cost / (discharge_date - admit_date) AS cost_per_day
FROM admissions
ORDER BY los DESC;





