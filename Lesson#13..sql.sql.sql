--create a students table
CREATE TABLE students (
   student_id INT NOT NULL,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   class VARCHAR(20),
   age INT,
   PRIMARY KEY (student_id)
);


-- create a marksheet table
CREATE TABLE marksheet (
   score INT,
   year INT,
   ranking INT,
   class VARCHAR(20),
   student_id INT
);


--Query to insert values into students & marksheet tables
INSERT INTO students (student_id, first_name, last_name, class, age) VALUES
(1, 'krishna', 'gee', 10, 18),
(2, 'Stephen', 'Christ', 10, 17),
(3, 'Kailash', 'kumar', 10, 18),
(4, 'ashish', 'jain', 10, 16),
(5, 'khusbu', 'jain', 10, 17),
(6, 'madhan', 'lal', 10, 16),
(7, 'saurab', 'kothari', 10, 15),
(8, 'vinesh', 'roy', 10, 14),
(9, 'rishika', 'r', 10, 15),
(10, 'sara', 'rayan', 10, 16),
(11, 'rosy', 'kumar', 10, 16);

INSERT INTO marksheet (score, year, class, ranking, student_id) VALUES
(989, 2014, 10, 1, 1),
(454, 2014, 10, 10, 2),
(880, 2014, 10, 4, 3),
(870, 2014, 10, 5, 4),
(720, 2014, 10, 7, 5),
(670, 2014, 10, 8, 6),
(900, 2014, 10, 3, 7),
(540, 2014, 10, 9, 8),
(801, 2014, 10, 6, 9),
(420, 2014, 10, 11, 10),
(970, 2014, 10, 2, 11),
(720, 2014, 10, 12, 12);


--Query to display the students ID, first name of every student
SELECT student_id, first_name
FROM students
WHERE age >= 16 AND LOWER(last_name) = 'kumar';


--Query to display the details of every student from the marksheet
SELECT *
FROM marksheet
WHERE score BETWEEN 800 AND 1000;


--Query to increase the score in the marksheet table by five and create a new score column to display this new score 
SELECT *, score + 5 AS new_score
FROM marksheet;


--Query to display the marksheet table in descending order of the score 
SELECT *
FROM marksheet
ORDER BY score DESC;

--Query to display the details of every student whose first name starts with an ‘a’ 
SELECT *
FROM students
WHERE LOWER(first_name) LIKE 'a%';






