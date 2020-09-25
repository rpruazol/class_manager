DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    available BOOLEAN DEFAULT 'TRUE',
    date_added TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_DATE
);

DROP TABLE IF EXISTS paired_history;

CREATE TABLE paired_history (
    id SERIAL PRIMARY KEY,
    student_name VARCHAR(255),
    paired_student VARCHAR(255),
    available BOOLEAN DEFAULT 'TRUE',
    date_added TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_DATE
);

INSERT INTO students (first_name, last_name) VALUES (Anthony Beaver,
Brandon Gonzalez,
Michael Campbell,
Doug Pfeffer,
Louis Caruso,
Cody Carpenter,
Chase McFaddin,
Deanna Johnson,
Felicia Walcott,
Grace Choi,
Matthew Holder,
Jae Choi,
Alan Karlo Mangubat,
Klace Koch,
Kyle Atkinson,
Logan Jones,
michael greene,
Michael Mandell,
Nick Dorkins,
Kat Gonzalez,
Nebiyu Kifle,
Rolando MH,
Kale Lesko,
Scott Falbo,
Sean Hawkins,
Henry Funk,
Sam Clark)