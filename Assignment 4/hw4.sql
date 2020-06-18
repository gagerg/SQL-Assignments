/*Gage Gutmann
CPSC321
Homework 4
This file contains the script for creating a database of table for a albums and their related info
*/

DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS album;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS group_mus;
DROP TABLE IF EXISTS artist;

/*Takes the record label info for albums*/
CREATE TABLE company(
    label_name VARCHAR(80) NOT NULL,
    label_found INT,
    lable_type VARCHAR(80),
    PRIMARY KEY (label_name)
);


/* Specifies the information of the music groups related to the albums*/
CREATE TABLE group_mus(
    group_name VARCHAR(80) NOT NULL,
    group_found VARCHAR(80),
    genre VARCHAR(80),
    influences VARCHAR(80),
    PRIMARY KEY (group_name)
    /*FOREIGN KEY (group_name) REFERENCES member(group_name)*/
);

/*Information about individual artists that could be in a music group*/
CREATE TABLE artist(
    first_name VARCHAR(80),
    last_name VARCHAR(80),
    dob DATE,
    PRIMARY KEY (first_name,last_name)
);

/* Links the group_mus table and the artist table*/
CREATE TABLE member(
    group_name VARCHAR(80),
    first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
    range_start YEAR,
    range_end YEAR,
    PRIMARY KEY (group_name, first_name, last_name),
    FOREIGN KEY (first_name,last_name) REFERENCES artist(first_name,last_name),
    FOREIGN KEY (group_name) REFERENCES group_mus(group_name)
);
    
    

/*THe album comprised as a whole*/
CREATE TABLE album(
    title VARCHAR(80),
    year_rec YEAR,
    group_name VARCHAR(80),
    songs VARCHAR(80),
    label_name VARCHAR(80),
    PRIMARY KEY (title),
    FOREIGN KEY(label_name) REFERENCES company(label_name),
    FOREIGN KEY(group_name) REFERENCES group_mus(group_name)
);

INSERT INTO company(label_name, label_found, lable_type) VALUES ('Geffen', 1990, 'Indie');
INSERT INTO company(label_name, label_found, lable_type) VALUES ('Sony', 1960, 'Major');
INSERT INTO company(label_name, label_found, lable_type) VALUES ('Island Records', 1997, 'Indie');
INSERT INTO company(label_name, label_found, lable_type) VALUES ('Capitol Records', 2000, 'Major');
INSERT INTO company(label_name, label_found, lable_type) VALUES ('Warner', 1970, 'Major');
INSERT INTO company(label_name, label_found, lable_type) VALUES ('Sub Pop', 1990, 'Indie');


INSERT INTO group_mus(group_name, group_found, genre, influences) VALUES ('Nirvana', 1987, 'Alternative',NULL);
INSERT INTO group_mus(group_name, group_found, genre, influences) VALUES ('Old Dominion', 2014, 'Country', 'Dierks Bentley, Aerosmith');
INSERT INTO group_mus(group_name, group_found, genre, influences) VALUES ('Dierks Bentley', 2002, 'Country', NULL);
INSERT INTO group_mus(group_name, group_found, genre, influences) VALUES ('The Killers', 1999, 'Rock', 'Nirvana');
INSERT INTO group_mus(group_name, group_found, genre, influences) VALUES ('Mark Morrison', 1990, 'Rap', NULL);
INSERT INTO group_mus(group_name, group_found, genre, influences) VALUES ('Aerosmith', 1970, 'Rock', NULL);
INSERT INTO group_mus(group_name, group_found, genre, influences) VALUES ('Joe Perry', 1980, 'Rock', 'Aerosmith');
INSERT INTO group_mus(group_name, group_found, genre, influences) VALUES ('Band of Horses', 2000, 'Alternative', NULL);
INSERT INTO group_mus(group_name, group_found, genre, influences) VALUES ('Foo Fighters', 1995, 'Alternative', 'Nirvana');

INSERT INTO artist(first_name, last_name, dob) VALUES ('Dave', 'Grohl', '1965-09-04');
INSERT INTO artist(first_name, last_name, dob) VALUES ('Kurt', 'Cobain', '1968-08-03');
INSERT INTO artist(first_name, last_name, dob) VALUES ('Dierks', 'Bentley', '1970-10-05');
INSERT INTO artist(first_name, last_name, dob) VALUES ('Mark', 'Morrison', '1980-11-08');
INSERT INTO artist(first_name, last_name, dob) VALUES ('Steven', 'Tyler', '1959-12-25');
INSERT INTO artist(first_name, last_name, dob) VALUES ('Joe', 'Perry', '1961-12-18');

INSERT INTO member VALUES('Nirvana','Dave', 'Grohl', 1987, 1994);
INSERT INTO member VALUES('Foo Fighters', 'Dave', 'Grohl', 1995, NULL);
INSERT INTO member VALUES('Dierks Bentley', 'Dierks', 'Bentley', 2002, NULL);
INSERT INTO member VALUES('Nirvana', 'Kurt', 'Cobain', 1987, 1994);
INSERT INTO member VALUES('Mark Morrison', 'Mark', 'Morrison', 1990, 1996);
INSERT INTO member VALUES('Aerosmith', 'Steven', 'Tyler', 1970, NULL);
INSERT INTO member VALUES('Aerosmith', 'Joe', 'Perry', 1980, NULL);
INSERT INTO member VALUES('Joe Perry', 'Joe', 'Perry', 1980, 1990);





INSERT INTO album(title, year_rec, group_name, songs, label_name) VALUES ('Nevermind', 1991, 'Nirvana', 'Smells Like Teen Spirit, Lithium, Drain You', 'Geffen');
INSERT INTO album(title, year_rec, group_name, songs, label_name) VALUES ('Happy Endings', 2017, 'Old Dominion', 'Hotel Key, Be With Me, Written in the Sand', 'Sony');
INSERT INTO album(title, year_rec, group_name, songs, label_name) VALUES ('Old Dominion', 2019, 'Old Dominion', 'Make It Sweet, One Man Band, Some People Say', 'Sony');
INSERT INTO album(title, year_rec, group_name, songs, label_name) VALUES ('Hot Fuss', 2004, 'The Killers', 'Mr. Brightside, Smile Like You Mean It, All These Things Ive Done', 'Island Records');
INSERT INTO album(title, year_rec, group_name, songs, label_name) VALUES ('The Mountain', 2018, 'Dierks Bentley', 'Living, One Way, Son of the Sun', 'Capitol Records');
INSERT INTO album(title, year_rec, group_name, songs, label_name) VALUES ('In Utero', 1993, 'Nirvana', 'All Apologies, Heart-Shaped Box', 'Geffen');
INSERT INTO album(title, year_rec, group_name, songs, label_name) VALUES ('Return of the Mack', 1996, 'Mark Morrison', 'Return of the Mack, Crazy, Lets Get Down', 'Warner');
INSERT INTO album(title, year_rec, group_name, songs, label_name) VALUES ('Rocks', 1996, 'Aerosmith', 'Back in the Saddle, Last Child, Nobodys Fault', 'Sony');
INSERT INTO album(title, year_rec, group_name, songs, label_name) VALUES ('Everything All the Time', 2006, 'Band of Horses', 'The Funeral, I Go to the Barn Because I Like the, Monsters', 'Sub Pop');

SELECT * FROM album;
SELECT * FROM company;
SELECT * FROM group_mus;
SELECT * FROM artist;
SELECT * FROM member;


