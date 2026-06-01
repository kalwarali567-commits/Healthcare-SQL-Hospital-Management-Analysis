
CREATE TABLE patients (
	patient_id VARCHAR(20) PRIMARY KEY,
	patient_name VARCHAR(100) NOT NULL,
	gender VARCHAR(50),
	age INT,
	city VARCHAR(100)
);



CREATE TABLE icd_reference(
	icd_code VARCHAR(20) PRIMARY KEY,
	diagnosis VARCHAR(100)
);

CREATE TABLE admissions (
	admission_id VARCHAR(20) PRIMARY KEY,
	patient_id VARCHAR(20) ,
	admit_date DATE,
	discharge_date DATE,
	icd_code VARCHAR(20),
	department VARCHAR(100),
	treatment_cost INT,
	FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
	FOREIGN KEY(icd_code) REFERENCES icd_reference(icd_code)
);
