

CREATE TABLE employee (
    emp_id     INTEGER PRIMARY KEY,
    f_name     TEXT,
    l_name     TEXT,
    job_id     TEXT,
    salary     INTEGER,
    manager_id TEXT,
    dept_id    INTEGER
);


-- INSERT THE DATA 
INSERT INTO employee (emp_id, f_name, l_name, job_id, salary, manager_id, dept_id) VALUES
(101, 'John',    'Smith',    'JP123', 70000, '02', 30),
(102, 'Emily',   'Johnson',  'EN456', 80000, '03', 40),
(103, 'Michael', 'Williams', 'MW789', 90000, '04', 20),
(104, 'Emma',    'Jones',    'EJ567', 75000, '02', 10),
(105, 'Calvin',  'Miller',   'CM345', 85000, '03', 30),
(106, 'Sophia',  'Davis',    'SD678', 95000, '04', 20),
(107, 'Liam',    'Moore',    'LM901', 72000, '02', 40),
(108, 'Olivia',  'Anderson', 'OA234', 87000, '03', 10),
(109, 'William', 'Brown',    'WB567', 92000, '04', 30),
(110, 'Ava',     'Taylor',   'AT890', 78000, '02', 20);


SELECT * FROM employee;


-- HIGHER SALARY THAN CALVIN 
SELECT e1.f_name, e1.l_name
FROM employee e1
INNER JOIN employee e2
  ON e2.f_name = 'Calvin'
 AND e1.salary > e2.salary;


-- ABOVE AVERAGE SALARY
SELECT emp_id, l_name
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);


--HIGHER SALARY THAN MW789
SELECT emp_id, f_name
FROM (
    SELECT emp_id, f_name, salary FROM employee
    EXCEPT
    SELECT emp_id, f_name, salary FROM employee
    WHERE salary <= (SELECT salary FROM employee WHERE job_id = 'MW789')
) t
ORDER BY salary;


-- TOP THREE EARNERS 
SELECT e.f_name, e.emp_id, e.salary
FROM employee e
INNER JOIN (
    SELECT emp_id
    FROM employee
    ORDER BY salary DESC
    LIMIT 3
) top3 ON e.emp_id = top3.emp_id
ORDER BY e.salary DESC;










