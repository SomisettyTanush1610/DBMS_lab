-- Create Student table
CREATE TABLE Student (
    Std_rollno INT PRIMARY KEY,
    Std_name VARCHAR(50),
    Dept VARCHAR(50),
    Course1 CHAR(50),
    Course2 CHAR(50),
    Course3 CHAR(50),
    Course4 CHAR(50)
);

-- Insert 5 student records
INSERT INTO Student (Std_rollno, Std_name, Dept, Course1, Course2, Course3, Course4) VALUES
(1, 'Sharv', 'CSE', 'DBMS', 'OS', 'DS', 'Maths'),
(2, 'Pawan', 'CSE', 'Signals', 'Networks', 'OS', 'Maths'),
(3, 'Alice', 'MECH', 'Thermo', 'Fluid', 'Mechanics', 'Maths'),
(4, 'Ruby', 'CSE', 'Structures', 'OS', 'DSA', 'Maths'),
(5, 'Penny', 'MME', 'Metallrgy', 'Geo', 'Chemistry', 'Maths');

-- Drop Course2 and Course3 columns
ALTER TABLE Student
DROP COLUMN Course2;

ALTER TABLE Student
DROP COLUMN Course3;

-- Add DoB and email columns
ALTER TABLE Student
ADD DoB DATE,
ADD email VARCHAR(50) CONSTRAINT email_format CHECK (email LIKE '%@nitt.edu');

update Student set DoB = '2003-10-11' where Std_rollno = '3';
update Student set DoB = '2004-10-11' where Std_rollno = '1';
update Student set DoB = '2005-10-11' where Std_rollno = '2';
update Student set DoB = '2006-10-11' where Std_rollno = '4';
update Student set DoB = '2007-10-11' where Std_rollno = '5';

update Student set email = '106122101@nitt.edu' where Std_rollno = '1';
update Student set email = '106122110@nitt.edu' where Std_rollno = '2';
update Student set email = '106122088@nitt.edu' where Std_rollno = '3';
update Student set email = '106122001@nitt.edu' where Std_rollno = '4';
update Student set email = '106122002@nitt.edu' where Std_rollno = '5';


-- Change Course1 datatype to VARCHAR2
ALTER TABLE Student
MODIFY Course1 VARCHAR2(50);

-- Rename Std_rollno to Std_rno
ALTER TABLE Student
RENAME COLUMN Std_rollno TO Std_rno;

-- Update Course1 from 'DBMS' to 'OS'
UPDATE Student
SET Course1 = 'OS'
WHERE Course1 = 'DBMS';

-- Delete students with name starting with 'S'
DELETE FROM Student
WHERE Std_name LIKE 'S%';

-- Select students born after 2005
SELECT * FROM Student
WHERE DoB > '2005-12-31';

-- Simulate DROP TABLE
DROP TABLE Student;

-- Recreate the table to simulate TRUNCATE
CREATE TABLE Student (
    Std_rno INT PRIMARY KEY,
    Std_name VARCHAR(50),
    Dept VARCHAR(50),
    Course1 VARCHAR2(50),
    Course4 CHAR(50),
    DoB DATE NOT NULL,
    email VARCHAR(50) CONSTRAINT email_format CHECK (email LIKE '%@nitt.edu')
);

-- Simulate TRUNCATE
TRUNCATE TABLE Student;
