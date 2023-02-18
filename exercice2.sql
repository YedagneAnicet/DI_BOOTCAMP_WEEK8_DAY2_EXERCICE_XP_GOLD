-- Update 'Lea Benichou' and 'Marc Benichou' birth_dates to 02/11/1998.
UPDATE students
SET birth_date = to_date('02/11/1998', 'DD/MM/YYYY')
WHERE first_name IN ('Lea','Marc');

-- Change the last_name of David from 'Grez' to 'Guez'.
UPDATE students
SET last_name = 'Guez'
WHERE first_name = 'David';

-- Delete the student named 'Lea Benichou' from the table.
DELETE FROM students
WHERE first_name = 'Lea' 
AND last_name = 'Benichou';

-- Count how many students are in the table.
SELECT COUNT(*) AS allstudentcount
FROM students;

-- Count how many students were born after 1/01/2000.
SELECT COUNT(*) AS allstudentcount
FROM students
WHERE birth_date > to_date('01/01/2000', 'DD/MM/YYYY');

-- Add a column to the student table called math_grade.
ALTER TABLE students
ADD math_grade INT;

-- Add 80 to the student which id is 1.
UPDATE students
SET math_grade = 80
WHERE id = 1;

-- Add 90 to the students which have ids of 2 or 4.
UPDATE students
SET math_grade = 90
WHERE id IN (2, 4);

-- Add 40 to the student which id is 6.
UPDATE students
SET math_grade = 40
WHERE id = 6;

-- Count how many students have a grade bigger than 83.
SELECT first_name, last_name, COUNT(*) AS total_grade
FROM students
WHERE math_grade > 83
GROUP BY first_name, last_name;

-- Add another student named 'Omer Simpson' with the same birth_date as the one already in the table. Give him a grade of 70.
INSERT INTO students (first_name, last_name, birth_date, math_grade)
VALUES ('Omer','Simpson',to_date('03/10/1980', 'DD/MM/YYYY'), 70);

-- Bonus: Count how many grades each student has.
SELECT first_name, last_name, COUNT(math_grade) AS total_grade
FROM students
GROUP BY first_name, last_name;

-- Find the sum of all the students grades.
SELECT SUM(math_grade) AS total_grade
FROM students;