
-- Lab Sheet 06 - Task 5
-- Fixed Schema Experiments
-- Run each test separately. Tests 1-8 should fail.

USE university_db;

-- Test 1: Unknown column
INSERT INTO student (student_code, full_name, email, phone)
VALUES ('S010', 'Test One', 'test1@example.com', '0771234567');

-- Test 2: Missing NOT NULL value
INSERT INTO student (student_code, full_name)
VALUES ('S011', 'Test Two');

-- Test 3: Wrong data type
INSERT INTO course (code, title, credits, lecturer_id)
VALUES ('CS301', 'Test Course', 'three', 1);

-- Test 4: Duplicate UNIQUE value
INSERT INTO student (student_code, full_name, email)
VALUES ('S001', 'Test Three', 'test3@example.com');

-- Test 5: Exceeding VARCHAR length
INSERT INTO department (code, name)
VALUES ('D0000000001', 'Too Long Code');

-- Test 6: Invalid foreign key
INSERT INTO enrollment (student_id, course_id, grade)
VALUES (1, 999, 'A');

-- Test 7: Delete referenced department
DELETE FROM department
WHERE code = 'D01';

-- Test 8: CHECK constraint violation
INSERT INTO course (code, title, credits, lecturer_id)
VALUES ('CS302', 'Test Course', 10, 1);

-- Explicit schema modification
ALTER TABLE student ADD COLUMN phone VARCHAR(15);

DESCRIBE student;
SELECT * FROM student;

-- Restore original schema
ALTER TABLE student DROP COLUMN phone;
