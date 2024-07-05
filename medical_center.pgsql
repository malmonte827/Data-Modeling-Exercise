DROP DATABASE IF EXISTS medical_center_db;
CREATE DATABASE medical_center_db;
\c medical_center_db;



CREATE TABLE doctors 
(
    id SERIAL PRIMARY KEY,
    first_name TEXT   NOT NULL,
    last_name TEXT   NOT NULL,
    specialty TEXT   NOT NULL
    
);

CREATE TABLE patients 
(
    id SERIAL PRIMARY KEY,
    first_name   TEXT NOT NULL,
    last_name    TEXT NOT NULL,
    email        TEXT UNIQUE NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    birthday     DATE NOT NULL

);

CREATE TABLE diseases 
(
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL
    
);

CREATE TABLE appointments 
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors   NOT NULL,
    patient_id INTEGER REFERENCES patients NOT NULL,
    visit DATE  NOT NULL,
    notes TEXT
);

CREATE TABLE diagnoses 
(
    id SERIAL PRIMARY KEY,
    disease_id INTEGER REFERENCES diseases,
    appointment_id INTEGER REFERENCES appointments,
    description TEXT   NOT NULL
);


INSERT INTO doctors (first_name, last_name, specialty)
VALUES 
('Miranda', 'Bailey', 'General Surgery Attending'),
('Richard', 'Webber', 'General Surgery Attending'),
('Jo', 'Wilson', 'General Surgery Attending OB/GYN Resident');

INSERT INTO patients (first_name, last_name, email, phone_number, birthday)
VALUES
('Mabel', 'Pines', 'MabelPines@falls.com', '123-456-789', '2005-10-10'),
('Dipper', 'Pines', 'DipperPines@falls.com', '010-111-2131', '2005-10-10'),
('Grunkle', 'Stan', 'GrunkleStan@falls.com', '415-161-7189', '1950-12-30');

INSERT INTO diseases (name)
VALUES
('Asthma'),
('Leukemia'),
('Diabetes');

INSERT INTO appointments (doctor_id, patient_id, visit)
VALUES
(1,1, '2016-06-22'),
(2,2, '2016-05-10'),
(3,3, '2016-06-22');

INSERT INTO diagnoses (disease_id, appointment_id, description)
VALUES
(1,1, 'Has Asthma'),
(2,2, 'Has Leukemia'),
(3,3, 'Has Diabetes');

