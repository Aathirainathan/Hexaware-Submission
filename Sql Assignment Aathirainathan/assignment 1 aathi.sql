  CREATE DATABASE SISDB;

USE SISDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email NVARCHAR(100) UNIQUE,
    phone_number NVARCHAR(15)
);

CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50) NOT NULL,
    last_name NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) UNIQUE
);


CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name NVARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0),
    teacher_id INT FOREIGN KEY REFERENCES Teacher(teacher_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT FOREIGN KEY REFERENCES Students(student_id),
    course_id INT FOREIGN KEY REFERENCES Courses(course_id),
    enrollment_date DATE
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT FOREIGN KEY REFERENCES Students(student_id),
    amount DECIMAL(10,2),
    payment_date DATE
);

INSERT INTO Students VALUES 
('Aadhithya', 'Srinivasan', '2001-04-10', 'aadhithya.srinivasan@example.com', '9876543210'),
('Aarushi', 'Narayan', '2000-08-22', 'aarushi.narayan@example.com', '9123456789'),
('Karthik', 'Venugopal', '1999-11-30', 'karthik.venugopal@example.com', '9988776655'),
('Priya', 'Balasubramaniam', '2002-02-14', 'priya.balasubramaniam@example.com', '9876541234'),
('Anirudh', 'Ramasamy', '1998-07-05', 'anirudh.ramasamy@example.com', '9123450987'),
('Divya', 'Rajendran', '2000-10-25', 'divya.rajendran@example.com', '9876098765'),
('Vignesh', 'Iyer', '2001-12-17', 'vignesh.iyer@example.com', '9988771234'),
('Lakshmi', 'Sankaran', '2002-01-09', 'lakshmi.sankaran@example.com', '9876545678'),
('Shyam', 'Kumar', '1999-03-15', 'shyam.kumar@example.com', '9123009876'),
('Sowmya', 'Narayanan', '2003-05-21', 'sowmya.narayanan@example.com', '9988775432');

select * from Students;

INSERT INTO Teacher (first_name, last_name, email) VALUES
('Ram', 'Narayan', 'ram.narayan@example.com'),
('Janani', 'Sivakumar', 'janani.sivakumar@example.com'),
('Saravanan', 'Raja', 'saravanan.raja@example.com'),
('Muthu', 'Palanisamy', 'muthu.palanisamy@example.com'),
('Vijaya', 'Lakshmi', 'vijaya.lakshmi@example.com'),
('Kamal', 'Mani', 'kamal.mani@example.com'),
('Radhika', 'Sankar', 'radhika.sankar@example.com'),
('Ganesh', 'Perumal', 'ganesh.perumal@example.com'),
('Thiru', 'Arasan', 'thiru.arasan@example.com'),
('Madhavi', 'Natesan', 'madhavi.natesan@example.com');

select * from Teacher;

INSERT INTO Courses (course_name, credits, teacher_id) VALUES
('Tamil Literature', 3, 1),
('Mathematics', 4, 2),
('Physics', 4, 3),
('Chemistry', 3, 4),
('Computer Science', 5, 5),
('Biology', 4, 6),
('History', 2, 7),
('Geography', 2, 8),
('Political Science', 3, 9),
('Economics', 4, 10);

select * from Courses;

INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 2, '2024-01-15'),   
(2, 3, '2024-02-12'),   
(3, 4, '2024-03-10'),   
(4, 5, '2024-04-08'),   
(5, 6, '2024-05-05'),   
(6, 7, '2024-06-20'),   
(7, 8, '2024-07-15'),   
(8, 9, '2024-08-22'),   
(9, 10, '2024-09-17'),  
(10, 11, '2024-10-05'); 


SELECT * FROM Enrollments;


INSERT INTO Payments VALUES
(1, 500.00, '2024-01-20'),
(2, 600.00, '2024-02-15'),
(3, 550.00, '2024-03-10'),
(4, 700.00, '2024-04-05'),
(5, 450.00, '2024-05-15'),
(6, 500.00, '2024-06-20'),
(7, 650.00, '2024-07-18'),
(8, 600.00, '2024-08-22'),
(9, 700.00, '2024-09-10'),
(10, 550.00, '2024-10-01');


SELECT * FROM Payments;

INSERT INTO Students VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

select * from Students;

INSERT INTO Enrollments 
VALUES (1, 2, '2024-09-20');

select * from Enrollments;


UPDATE Teacher 
SET email = 'newemail@example.com'
WHERE teacher_id = 1;

select * from Teacher;


DELETE FROM Enrollments 
WHERE student_id = 1 AND course_id = 2;

select * from Enrollments;


UPDATE Courses 
SET teacher_id = 2 
WHERE course_id = 3;

select * from Courses;


DELETE FROM Payments 
WHERE student_id = 3;

DELETE FROM Enrollments 
WHERE student_id = 3;

DELETE FROM Students 
WHERE student_id = 3;

select * from Students;
select * from Enrollments;


UPDATE Payments 
SET amount = 750.00 
WHERE payment_id = 1;

select * from Payments;


SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 1
GROUP BY s.first_name, s.last_name;

SELECT c.course_name,COUNT(e.student_id) as number_of_students
FROM Courses c 
LEFT JOIN Enrollments e ON c.course_id=e.course_id
GROUP BY c.course_name;

SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;


SELECT t.first_name AS teacher_first_name, t.last_name AS teacher_last_name, c.course_name
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id;

SELECT s.first_name, s.last_name, e.enrollment_date,c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_id =7 ;


SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.student_id IS NULL;

SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.course_id IS NULL;

SELECT e.student_id, s.first_name, s.last_name, COUNT(e.course_id) AS number_of_courses
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
GROUP BY e.student_id, s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1;


SELECT t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;

SELECT AVG(student_count) AS avg_students_per_course
FROM (
    SELECT course_id, COUNT(student_id) AS student_count
    FROM Enrollments
    GROUP BY course_id
) AS enrollments_per_course;


SELECT s.first_name, s.last_name, p.amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (
    SELECT MAX(amount)
    FROM Payments
);


SELECT c.course_name
FROM Courses c
WHERE c.course_id IN (
    SELECT course_id
    FROM Enrollments
    GROUP BY course_id
    HAVING COUNT(student_id) = (
        SELECT MAX(enrollment_count)
        FROM (
            SELECT COUNT(student_id) AS enrollment_count
            FROM Enrollments
            GROUP BY course_id
        ) AS counts
    )
);


SELECT 
    t.first_name,
    t.last_name,
    (SELECT SUM(p.amount)
     FROM Payments p
     JOIN Enrollments e ON p.student_id = e.student_id
     WHERE e.course_id IN (
         SELECT c.course_id
         FROM Courses c
         WHERE c.teacher_id = t.teacher_id
     )) AS total_payments
FROM Teacher t;

SELECT s.first_name, s.last_name
FROM Students s
WHERE NOT EXISTS (
    SELECT course_id
    FROM Courses
    WHERE course_id NOT IN (
        SELECT course_id
        FROM Enrollments e
        WHERE e.student_id = s.student_id
    )
);
 
SELECT t.first_name, t.last_name
FROM Teacher t, Courses c
WHERE NOT EXISTS (
    SELECT course_id
    FROM Courses c
    WHERE c.teacher_id = t.teacher_id
);

SELECT AVG(age) AS avg_age
FROM (
    SELECT DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age
    FROM Students
) AS student_ages;

SELECT c.course_name
FROM Courses c
WHERE NOT EXISTS (
    SELECT e.enrollment_id
    FROM Enrollments e
    WHERE e.course_id = c.course_id
);



SELECT s.first_name,s.last_name,c.course_name,SUM(p.amount) AS total_payments
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
LEFT JOIN Payments p ON s.student_id = p.student_id AND e.course_id IN (
        SELECT e2.course_id 
        FROM Enrollments e2 
        WHERE e2.student_id = s.student_id
    )
GROUP BY s.student_id, s.first_name, s.last_name, c.course_name;


SELECT student_id, first_name, last_name
FROM Students
WHERE student_id IN (
    SELECT student_id
    FROM Payments
    GROUP BY student_id
    HAVING COUNT(payment_id) > 1
);


SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name;

SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

SELECT s.first_name, s.last_name, AVG(p.amount) AS average_payment
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name;







