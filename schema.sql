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
    paired_students VARCHAR(255),
    available BOOLEAN DEFAULT 'TRUE',
    date_added TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_DATE
);


INSERT INTO students (first_name, last_name) VALUES ('anthony', 'beaver');
INSERT INTO students (first_name, last_name) VALUES ('brandon', 'gonzalez');
INSERT INTO students (first_name, last_name) VALUES ('michael', 'campbell');
INSERT INTO students (first_name, last_name) VALUES ('doug', 'pfeffer');
INSERT INTO students (first_name, last_name) VALUES ('louis', 'caruso');
INSERT INTO students (first_name, last_name) VALUES ('cody', 'carpenter');
INSERT INTO students (first_name, last_name) VALUES ('chase', 'mcfaddin');
INSERT INTO students (first_name, last_name) VALUES ('deanna', 'johnson');
INSERT INTO students (first_name, last_name) VALUES ('felicia', 'walcott');
INSERT INTO students (first_name, last_name) VALUES ('grace', 'choi');
INSERT INTO students (first_name, last_name) VALUES ('matthew', 'holder');
INSERT INTO students (first_name, last_name) VALUES ('jae', 'choi');
INSERT INTO students (first_name, last_name) VALUES ('karlo', 'mangubat');
INSERT INTO students (first_name, last_name) VALUES ('klace', 'koch');
INSERT INTO students (first_name, last_name) VALUES ('kyle', 'atkinson');
INSERT INTO students (first_name, last_name) VALUES ('logan', 'jones');
INSERT INTO students (first_name, last_name) VALUES ('michael', 'greene');
INSERT INTO students (first_name, last_name) VALUES ('nick', 'dorkins');
INSERT INTO students (first_name, last_name) VALUES ('michael', 'mandell');
INSERT INTO students (first_name, last_name) VALUES ('kat', 'gonzalez');
INSERT INTO students (first_name, last_name) VALUES ('nebiyu', 'kifle');
INSERT INTO students (first_name, last_name) VALUES ('rolando', 'haynes');
INSERT INTO students (first_name, last_name) VALUES ('kale', 'lesko');
INSERT INTO students (first_name, last_name) VALUES ('scott', 'falbo');
INSERT INTO students (first_name, last_name) VALUES ('sean', 'hawkins');
INSERT INTO students (first_name, last_name) VALUES ('henry', 'funk');
INSERT INTO students (first_name, last_name) VALUES ('sam', 'clark');