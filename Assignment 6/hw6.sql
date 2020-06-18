/*Gage Gutmann
Homework 6
hw6.sql
This script creates countries as well as the varius components and attributes that make up those
countries. It then queries values based on criteria, with examples of INNER JOIN, aggregates, and UNION operators*/


DROP TABLE IF EXISTS Border;
DROP TABLE IF EXISTS City;
DROP TABLE IF EXISTS Province;
DROP TABLE IF EXISTS Country;

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


SELECT 'READING ASSIGNMENT';

SELECT 'Problem 1';
SELECT GROUP_CONCAT(DISTINCT province_name)
FROM City;

SELECT 'Problem 2';
SELECT STDDEV_POP(population_number), AVG(population_number)
FROM City;

SELECT 'Problem 3';
SELECT 'UNION EXAMPLE';

SELECT province_name 
FROM Province
UNION 
SELECT province_name
FROM City;

SELECT 'UNION ALL EXAMPLE';

SELECT province_name 
FROM Province
UNION ALL
SELECT province_name
FROM City;




SET @area = 600000;
SET @inflation = 2.5;
SET @gdp = 30000;

/*Problem 2*/
SELECT DISTINCT c.country_name, c.country_code, c.gdp, c.inflation
FROM Country c, Province p
WHERE c.country_code = p.country_code
    AND p.area <= @area
    AND c.gdp >= @gdp 
    AND c.inflation <= @inflation;

/*Problem 3*/
SELECT DISTINCT c.country_name, c.country_code, c.gdp, c.inflation
FROM Country c INNER JOIN Province p ON c.country_code = p.country_code
WHERE p.area <= @area
    AND c.gdp >= @gdp 
    AND c.inflation <= @inflation;

SET @population_number = 1000;

/*Problem 4*/
SELECT c.country_code, c.country_name, p.province_name, p.area, ci.city_name, ci.population_number
FROM Country c, Province p, City ci
WHERE ci.country_code = p.country_code
    AND p.country_code = c.country_code
    AND ci.province_name = p.province_name
    AND ci.population_number >= @population_number;

/*Problem 5*/
SELECT c.country_code, c.country_name, p.province_name, p.area, ci.city_name, ci.population_number
FROM Country c INNER JOIN Province p ON c.country_code = p.country_code INNER JOIN City ci ON ci.country_code = p.country_code
WHERE ci.province_name = p.province_name
    AND ci.population_number >= @population_number;

/*Problem 6*/

SET @gdp_1 = 9000;
SET @gdp_2 = 45000;

SELECT SUM(p.area) AS total_area
FROM Country c, Province p
WHERE c.country_code = p.country_code
    AND c.gdp >= @gdp_1
    AND c.gdp <= @gdp_2;

/*Problem 7*/

SELECT MIN(gdp) AS min_gdp, MAX(gdp) AS max_gdp, AVG(gdp) AS avg_gdp, MIN(inflation) AS min_inflation, MAX(inflation) AS max_inflation, AVG(inflation) AS avg_inflation
FROM Country;


/*Problem 8*/
SET @country_code = 'US';
SET @country_name = 'United States of America';

SELECT COUNT(ci.city_name) AS num_cities, AVG(ci.population_number) AS avg_population
FROM City ci, Country c 
WHERE ci.country_code = c.country_code
    AND ci.country_code = @country_code;


/*Problem 9*/
SET @city_name = 'Calgary';

SELECT AVG(ci2.population_number) AS pop_average
FROM City ci1, City ci2, Province p
WHERE ci1.city_name = @city_name
    AND ci1.province_name = p.province_name
    AND ci2.province_name = p.province_name
    AND ci2.city_name != ci1.city_name;

/*Problem 11 --CHECK, Only returning 1 value, should return 2*/
SET @country_code = 'ESP';

SELECT DISTINCT COUNT(b1.country_code_2 + b2.country_code_1) AS num_countries, AVG(b1.border_length + b2.border_length) AS ave_length
FROM Country c, Border b1, Border b2
WHERE b1.country_code_1 = c.country_code
    AND b2.country_code_2 = c.country_code
    AND b1.country_code_1 = @country_code
    AND b2.country_code_2 = @country_code;


/*Problem 12 -CHECK, returning all countries. Think of more conditionals and possible self joins*/
SELECT c.country_name AS country
FROM Country c, Border b
WHERE b.country_code_1 = c.country_code
UNION 
SELECT c.country_name AS border_country
FROM Country c, Border b
WHERE b.country_code_2 = c.country_code;