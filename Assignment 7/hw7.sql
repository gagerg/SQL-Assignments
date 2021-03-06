/*Gage Gutmann
Homework 7
hw7.sql
This script creates countries as well as the varius components and attributes that make up those
countries. It then queries values based on criteria, using JOINS, GROUP BY, HAVING, ORDER BY, 
as well as creating VIEWS and PREPARE statements*/


DROP TABLE IF EXISTS Border;
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS Province;
DROP TABLE IF EXISTS Country;
DROP VIEW IF EXISTS sym_borders;

CREATE TABLE Country(
    country_code VARCHAR(50),
    country_name VARCHAR(50),
    gdp INT,
    inflation DECIMAL(5,2),
    PRIMARY KEY (country_code)
);

CREATE TABLE Province(
    province_name VARCHAR(50),
    country_code VARCHAR(50),
    area INT,
    PRIMARY KEY (province_name, country_code),
    FOREIGN KEY(country_code) REFERENCES Country(country_code)
);

CREATE TABLE City(
    city_name VARCHAR(50),
    province_name VARCHAR(50),
    country_code VARCHAR(50),
    population_number INT, 
    PRIMARY KEY (city_name, province_name, country_code),
    FOREIGN KEY (province_name, country_code) REFERENCES Province(province_name, country_code)
);

CREATE TABLE Border(
    country_code_1 VARCHAR(50),
    country_code_2 VARCHAR(50),
    border_length INT,
    PRIMARY KEY (country_code_1, country_code_2),
    FOREIGN KEY (country_code_1) REFERENCES Country(country_code),
    FOREIGN KEY (country_code_2) REFERENCES Country(country_code)
);


/*For Reading Assignment*/
CREATE TABLE department(
    dept_name VARCHAR(80),
    building VARCHAR(80),
    budget NUMERIC(12,2)
);

/*For Reading Assignment*/
INSERT INTO department VALUES('Computer Science', 'Herak', 12000.00);
INSERT INTO department VALUES('Biology', NULL, NULL);
INSERT INTO department VALUES('Philosophy','College Hall', 5000.00);
INSERT INTO department VALUES('Business', NULL, NULL);
INSERT INTO department VALUES('Chemistry', 'Hughes', 3000.00);
INSERT INTO department VALUES('Computer Science', 'College Hall', 5000.00);
INSERT INTO department VALUES('Chemistry', 'Hughes', 2000.00);

SELECT dept_name, COUNT(*)
FROM department 
GROUP BY dept_name 
HAVING COUNT(*) != 2;


INSERT INTO Country VALUES('US', 'United States of America', 62904, 1.70);
INSERT INTO Country VALUES('CAN', 'Canada', 46261, 1.90);
INSERT INTO Country VALUES('MEX', 'Mexico', 9811, 3.00);
INSERT INTO Country VALUES('GUA', 'Guatemala', 4549, 3.01);
INSERT INTO Country VALUES('HON', 'Honduras', 2483, 4.42);
INSERT INTO Country VALUES('SAL', 'El Salvador', 4058, -0.68);
INSERT INTO Country VALUES('POR', 'Portugal', 23157, -0.10);
INSERT INTO Country VALUES('ESP', 'Spain', 30380, 0.10);
INSERT INTO Country VALUES('FRA', 'France', 41460, 0.90);


INSERT INTO Province VALUES('Washington', 'US', 114721);
INSERT INTO Province VALUES('Alaska', 'US', 1067197);
INSERT INTO Province VALUES('Texas', 'US', 432146);
INSERT INTO Province VALUES('California', 'US', 263386);
INSERT INTO Province VALUES('Conneticut', 'US', 8918);
INSERT INTO Province VALUES('Delaware', 'US', 4004);
INSERT INTO Province VALUES('Rhode Island', 'US', 2485);
INSERT INTO Province VALUES('Alberta', 'CAN', 660000);
INSERT INTO Province VALUES('Manitoba', 'CAN', 649950);
INSERT INTO Province VALUES('Sonora', 'MEX', 184934);
INSERT INTO Province VALUES('Chihuahua', 'MEX', 247455);
INSERT INTO Province VALUES('Guatemala', 'GUA', 108890);
INSERT INTO Province VALUES('Honduras', 'HON', 112090);
INSERT INTO Province VALUES('El Salvador', 'SAL', 21041);
INSERT INTO Province VALUES('Portugal', 'POR', 92090);
INSERT INTO Province VALUES('Spain', 'ESP', 505990);
INSERT INTO Province VALUES('France', 'FRA', 543940);

INSERT INTO City VALUES('Seattle', 'Washington', 'US', 688245);
INSERT INTO City VALUES('Spokane', 'Washington', 'US', 212982);
INSERT INTO City VALUES('Anchorage', 'Alaska', 'US', 297832);
INSERT INTO City VALUES('Juneau', 'Alaska', 'US', 32063);
INSERT INTO City VALUES('Houston', 'Texas', 'US', 2325502);
INSERT INTO City VALUES('San Antonio', 'Texas', 'US', 1532233);
INSERT INTO City VALUES('Los Angeles', 'California', 'US', 4057841);
INSERT INTO City VALUES('San Diego', 'California', 'US', 1453775);
INSERT INTO City VALUES('Bridgeport', 'Conneticut', 'US', 147629);
INSERT INTO City VALUES('New Haven', 'Conneticut', 'US', 130322);
INSERT INTO City VALUES('Wilmington', 'Delaware', 'US', 70635);
INSERT INTO City VALUES('Dover', 'Delaware', 'US', 38079);
INSERT INTO City VALUES('Providence', 'Rhode Island', 'US', 179870);
INSERT INTO City VALUES('Warwick', 'Rhode Island', 'US', 81288);
INSERT INTO City VALUES('Winnipeg', 'Manitoba', 'CAN', 705244);
INSERT INTO City VALUES('Brandon', 'Manitoba', 'CAN', 48859);
INSERT INTO City VALUES('Calgary', 'Alberta', 'CAN', 1237656);
INSERT INTO City VALUES('Edmonton', 'Alberta', 'CAN', 1062643);
INSERT INTO City VALUES('Red Deer', 'Alberta', 'CAN', 100418);
INSERT INTO City VALUES('Lethbridge', 'Alberta', 'CAN', 92729);

INSERT INTO City VALUES('Hermosillo', 'Sonora', 'MEX', 829000);
INSERT INTO City VALUES('Nogales', 'Sonora', 'MEX', 249400);
INSERT INTO City VALUES('Chihuahua', 'Chihuahua', 'MEX', 932600);
INSERT INTO City VALUES('Delicias', 'Chihuahua', 'MEX', 136100);
INSERT INTO City VALUES('Guatemala City', 'Guatemala', 'GUA', 942348);
INSERT INTO City VALUES('Villa Nueva', 'Guatemala', 'GUA', 301947);
INSERT INTO City VALUES('Tegucigalpa', 'Honduras', 'HON', 850848);
INSERT INTO City VALUES('San Pedro Sula', 'Honduras', 'HON', 489466);
INSERT INTO City VALUES('San Salvador', 'El Salvador', 'SAL', 525990);
INSERT INTO City VALUES('Soyapango', 'El Salvador', 'SAL', 329708);
INSERT INTO City VALUES('Lisbon', 'Portugal', 'POR', 517802);
INSERT INTO City VALUES('Porto', 'Portugal', 'POR', 249633);
INSERT INTO City VALUES('Madrid', 'Spain', 'ESP', 3255944);
INSERT INTO City VALUES('Barcelona', 'Spain', 'ESP', 1621537);
INSERT INTO City VALUES('Paris', 'France', 'FRA', 2138551);
INSERT INTO City VALUES('Marseille', 'France', 'FRA', 794811);

INSERT INTO Border VALUES('US', 'CAN', 8891);
INSERT INTO Border VALUES('US', 'MEX', 3145);
INSERT INTO Border VALUES('MEX', 'GUA', 871);
INSERT INTO Border VALUES('GUA', 'HON', 256);
INSERT INTO Border VALUES('HON', 'SAL', 100);
INSERT INTO Border VALUES('POR', 'ESP', 1214);
INSERT INTO Border VALUES('ESP', 'FRA', 64);

SELECT * FROM Country;
SELECT * FROM Province;
SELECT * FROM City;
SELECT * FROM Border;

/*Query 1*/
SELECT c.country_name, c.gdp, c.inflation, SUM(ci.population_number)
FROM Country c JOIN City ci ON c.country_code = ci.country_code
GROUP BY c.country_name;

/*Query 2*/
SELECT p.province_name, p.area, SUM(ci.population_number)
FROM Province p JOIN City ci ON p.province_name = ci.province_name
GROUP BY p.province_name 
HAVING SUM(ci.population_number) > 5000000;

/*Query 3*/
SELECT c.country_code, c.country_name, COUNT(ci.country_code)
FROM Country c JOIN City ci ON c.country_code = ci.country_code
GROUP BY c.country_code
ORDER BY COUNT(ci.country_code) DESC;

/*Query 4*/
SELECT c.country_code, c.country_name, SUM(p.area)
FROM Country c JOIN Province p ON c.country_code = p.country_code
GROUP BY c.country_code
ORDER BY SUM(p.area) DESC;

/*Query 5*/
SET @city_limit = 3;
SELECT DISTINCT c.country_name
FROM Country c JOIN Province p ON c.country_code = p.country_code JOIN City ci ON ci.country_code = p.country_code
HAVING COUNT(ci.country_code) >= @city_limit;



/*Query 6*/

SET @area = 2000000;
SET @gdp = 10000;

SELECT c.country_code, c.gdp, SUM(p.area), COUNT(ci.population_number)
FROM Country c JOIN Province p ON c.country_code = p.country_code JOIN City ci ON p.country_code = ci.country_code
GROUP BY c.country_code
HAVING SUM(p.area) < @area AND c.gdp > @gdp
ORDER BY COUNT(ci.population_number), c.gdp DESC;

/*Query 7*/
CREATE VIEW sym_borders AS 
SELECT country_code_1, country_code_2, border_length
FROM Border  
WHERE country_code_1 != country_code_2
    AND country_code_2 != country_code_1
UNION
SELECT country_code_2, country_code_1, border_length
FROM Border 
WHERE country_code_1 != country_code_2
    AND country_code_2 != country_code_1;

SELECT * FROM sym_borders;

/*Query 8*/

SELECT s.country_code_1 AS country, s.country_code_2 AS border_country
FROM sym_borders s JOIN Country c1 ON s.country_code_1 = c1.country_code JOIN Country c2 ON s.country_code_2 = c2.country_code
WHERE c1.gdp < c2.gdp
    AND c1.inflation > c2.inflation;

/*Query 9*/

SELECT s.country_code_1 AS country, AVG(c2.gdp) AS avg_gdp, AVG(c2.inflation) AS avg_inflation
FROM sym_borders s JOIN Country c1 ON s.country_code_1 = c1.country_code JOIN Country c2 ON s.country_code_2 = c2.country_code
GROUP BY s.country_code_1
ORDER BY AVG(c2.gdp) ASC, AVG(c2.inflation) ASC;

/*Problem 10*/

/*Prepared Statement 1
Takes the names of the cities where the population is less than
the given value*/

PREPARE get_city_name FROM 
    "SELECT city_name FROM City WHERE population_number < ?";

SET @population_number = 1000000;

EXECUTE get_city_name USING @population_number;

SET @population_number = 500000;

EXECUTE get_city_name USING @population_number;

SET @population_number = 100000;

EXECUTE get_city_name USING @population_number;


/*Prepared Statement 2
Finds all the provinces that are in the country of the given
country code*/

PREPARE get_province_name FROM
    "SELECT province_name FROM Province WHERE country_code = ?";

SET @country_code = "US";

EXECUTE get_province_name USING @country_code;

SET @country_code = "ESP";

EXECUTE get_province_name USING @country_code;

SET @country_code = "CAN";

EXECUTE get_province_name USING @country_code;

SET @country_code = "POR";

EXECUTE get_province_name USING @country_code;


