-- Hospital Management Database System
-- PostgreSQL Project

-- =========================
-- CREATE PATIENTS TABLE
-- =========================

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(10),
    date_of_birth DATE,
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================
-- CREATE DOCTORS TABLE
-- =========================

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialty VARCHAR(100) NOT NULL,
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================
-- CREATE APPOINTMENTS TABLE
-- =========================

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients(patient_id),
    doctor_id INT REFERENCES doctors(doctor_id),
    appointment_date DATE NOT NULL,
    reason TEXT,
    status VARCHAR(20) DEFAULT 'Pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- =========================
-- INSERT PATIENT DATA
-- =========================

INSERT INTO patients 
(first_name, last_name, gender, date_of_birth, phone, email, address)
VALUES
('Leah', 'Khamis',	'Female', '2000-09-17',	'0734873456', 'leah@gmail.com',	'Dodoma'),	
('Marco', 'Robert',	'Male',	'2001-03-23', '0743123456',	'marco@gmail.com', 'Singida'),
('Sauda', 'Kalori',	'Female', '2002-08-19', '0623834567', 'sauda@gmail.com', 'Mara'),
('Neema', 'Bonny', 'Female', '1999-05-15', '0655557334', 'neema@gmail.com', 'Dar es salaam');	

-- =========================
-- INSERT DOCTOR DATA
-- =========================

INSERT INTO doctors
(first_name, last_name, specialty, phone, email)
VALUES (‘Rama’,  ‘Mwangi’,  ‘Cardiologist’, 	0812635547	'rama@hospitalgmail.com'),	
('Marry', 'Joseph', 'Pediatrician', '0629984763', 'marry@hospitalgmail.com'),
('David', 'Miraj', 'Dentist', '0635443325', 'david@hospitalgmail.com'),	
('Sophia', 'Nyanda', 'oculist', '0712346543', 'sophia@hospitalgmail.com'),	
('Lucia', 'Kabido', 'Dematologist',	'0624443122', 'lucia@hospitalgmail.com');

--==========================
-- INSERT APPOINTMENTS
-- =========================

INSERT INTO appointments
(patient_id, doctor_id, appointment_date, reason)
VALUES
(3,	1,	'2026-04-12','Fever and headache'),	
(4,	5,	'2026-11-09','Child consultation'),	
(5,	4,	'2026-06-14','Chest pain and heart examinattion'),	
(3,	4,	'2026-02-01','Injury from accient'),	
(1,	3,	'2026-06-08','Regular chekup	Completed');	

-- =========================
-- CREATE VIEW
-- =========================

CREATE VIEW hospital_report AS
SELECT
    p.first_name AS patient,
    d.first_name AS doctor,
    d.specialty,
    a.appointment_date,
    a.reason,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;


-- =========================
-- CREATE INDEX
-- =========================

CREATE INDEX idx_patient_name
ON patients(first_name);



    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
