
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS department;


CREATE TABLE department(
    dept_name VARCHAR(80),
    building VARCHAR(80),
    budget NUMERIC(12,2),
    PRIMARY KEY (dept_name)
);

CREATE TABLE course(
    course_id VARCHAR(80),
    title VARCHAR(80),
    dept_name VARCHAR(80),
    credits numeric(2,0),
    PRIMARY KEY (course_id),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

INSERT INTO department VALUES('Computer Science', 'Herak', 12000.00);
INSERT INTO department VALUES('Biology', 'Hughes', 15000.00);
INSERT INTO department VALUES('Philosophy','College Hall', 5000.00);
INSERT INTO department VALUES('Business', 'Jepson', 7000.00);

INSERT INTO course VALUES('CPSC321', 'Computer Science','Computer Science', 3);
INSERT INTO course VALUES('BIO105', 'Intro','Biology', 2);
INSERT INTO course VALUES('PHIL105', 'Philosophy','Philosophy', 1);
INSERT INTO course VALUES('BUS305', 'Operations','Business', 3);


SELECT * FROM department;
SELECT * FROM course;

WITH most_credit(val) AS
    (SELECT MAX(credits)
    FROM course)
SELECT c.course_id, c.title
FROM course c, most_credit m
WHERE c.credits = m.val;

SELECT * 
FROM department d RIGHT OUTER JOIN course c ON c.title = d.dept_name;

/*Update 1 row*/
UPDATE department
SET budget = 10000.00
WHERE dept_name = 'Computer Science';

SELECT * FROM department;

/*Update Multiple rows*/
UPDATE department
SET budget = budget * 2;

SELECT * FROM department;

/*Delete 1 row*/
DELETE FROM department 
WHERE dept_name = 'Business';

SELECT * FROM department;

/*Delete Multiple rows*/

DELETE FROM department 
WHERE budget > 15000.00;

SELECT * FROM department;


/*SELECT * FROM department NATURAL JOIN course;*/



