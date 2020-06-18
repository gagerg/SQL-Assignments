/*Gage Gutmann
CPSC 321
HW10
This script creates a table for employee and indexes on different attributes
*/
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee(
    employee_id INT,
    salary INT,
    title VARCHAR(80),
    PRIMARY KEY (employee_id)
);

/*STEP 4*/

CREATE INDEX sal_idx ON Employee (salary);


/*STEP 5*/

CREATE INDEX title_sal_idx ON Employee (title,salary);


SELECT * 
FROM Employee
WHERE title = 'administrator' AND salary >= 30000;
