

CREATE TABLE patients (
    "date"       DATE,
    pid          VARCHAR(10) PRIMARY KEY,
    p_name       VARCHAR(50),
    age          INT,
    weight       INT,
    gender       VARCHAR(10),
    location     VARCHAR(50),
    phone_no     VARCHAR(15),
    disease      VARCHAR(50),
    doctor_name  VARCHAR(50),
    doctor_id    INT
);

INSERT INTO patients
("date", pid, p_name, age, weight, gender, location, phone_no, disease, doctor_name, doctor_id)
VALUES
('2019-06-15','AP2021','Sarath',67,76,'Male','chennai','5462829','Cardiac','Mohan',21),
('2019-02-13','AP2022','John',62,80,'Male','banglore','1234731','Cancer','Suraj',22),
('2018-01-08','AP2023','Henry',43,65,'Male','Kerala','9028320','Liver','Mehta',23),
('2020-02-04','AP2024','Carl',56,72,'Female','Mumbai','9293829','Asthma','Karthik',24),
('2017-09-15','AP2025','Shikar',55,71,'Male','Delhi','7821281','Cardiac','Mohan',21),
('2018-07-22','AP2026','Piysuh',47,59,'Male','Haryana','8912819','Cancer','Suraj',22),
('2017-03-25','AP2027','Stephen',69,55,'Male','Gujarat','8888211','Liver','Mehta',23),
('2019-04-22','AP2028','Aaron',75,53,'Male','Banglore','9012192','Asthma','Karthik',24);


--Total patients
SELECT COUNT(*) AS total_patients FROM patients;



-- Patient ID and name with current date
SELECT pid, p_name, DATE('now') AS current_date_col FROM patients;


--Old and new (uppercase) names
SELECT p_name AS old_name, UPPER(p_name) AS new_name FROM patients;


-- Names with character count
SELECT p_name, LENGTH(p_name) AS name_length FROM patients;


--Combine patient and doctor names
SELECT p_name, doctor_name, p_name || ' - ' || doctor_name AS patient_doctor FROM patients;


-- Extract the year
SELECT "date", STRFTIME('%Y', "date") AS year_col FROM patients;


-- Duplicate doctor names (Mohan 2, Suraj 2, Mehta 2, Karthik 2)
SELECT doctor_name, COUNT(*) AS occurrences
FROM patients
GROUP BY doctor_name
HAVING COUNT(*) > 1;













