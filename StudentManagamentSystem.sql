CREATE DATABASE Student_management_system;
USE Student_management_system;

CREATE TABLE Students (
		StudentID INT PRIMARY KEY,
        `Name` VARCHAR(50),
        Gender VARCHAR(20),
        DOB DATE,
        DepartmentID INT
        );
        
ALTER TABLE Students
ADD CONSTRAINT fk_students_department
FOREIGN KEY (DepartmentID)
REFERENCES departments(DepartmentID);

-- Inserting Values
INSERT INTO students (StudentID, `Name`, Gender, DOB, DepartmentID) VALUES
(1, 'Emeka Johnson', 'Male', '2002-05-12', 101),
(2, 'Grace Adeyemi', 'Female', '2003-03-09', 102),
(3, 'Tunde Olayemi', 'Male', '2001-12-22', 103),
(4, 'Ngozi Okafor', 'Female', '2002-07-17', 104),
(5, 'David Oluwole', 'Male', '2003-01-15', 101),
(6, 'Amaka Obi', 'Female', '2002-06-30', 102),
(7, 'Ifeanyi Nwosu', 'Male', '2001-10-11', 103),
(8, 'Bola Adedayo', 'Female', '2003-02-28', 104),
(9, 'Kelvin Musa', 'Male', '2002-09-19', 101),
(10, 'Mary Okon', 'Female', '2001-11-25', 102),
(11, 'Samuel Dogo', 'Male', '2002-04-14', 103),
(12, 'Rita Eze', 'Female', '2003-08-03', 104),
(13, 'John Adebayo', 'Male', '2002-12-05', 101),
(14, 'Amina Sani', 'Female', '2003-06-18', 102),
(15, 'Chidi Anozie', 'Male', '2001-03-26', 103),
(16, 'Deborah Alli', 'Female', '2002-11-09', 104),
(17, 'Micheal Femi', 'Male', '2003-05-20', 101),
(18, 'Blessing Iwu', 'Female', '2002-01-02', 102),
(19, 'Peter Onu', 'Male', '2001-07-29', 103),
(20, 'Esther Afolabi', 'Female', '2003-10-08', 104),
(21, 'Suleiman Umar', 'Male', '2002-08-16', 101),
(22, 'Chioma Nwachukwu', 'Female', '2001-02-13', 102),
(23, 'Daniel Ojo', 'Male', '2003-09-21', 103),
(24, 'Funmi Aina', 'Female', '2002-03-05', 104),
(25, 'Victor Uche', 'Male', '2001-06-27', 101),
(26, 'Patience Edet', 'Female', '2003-12-11', 102),
(27, 'Ibrahim Bello', 'Male', '2002-04-01', 103),
(28, 'Zainab Lawal', 'Female', '2003-07-24', 104),
(29, 'Collins Osei', 'Male', '2002-10-03', 101),
(30, 'Yetunde Aderemi', 'Female', '2001-09-06', 102),
(31, 'Uche Kalu', 'Male', '2003-11-14', 103),
(32, 'Halima Yusuf', 'Female', '2002-02-07', 104),
(33, 'Gbenga Alabi', 'Male', '2001-08-19', 101),
(34, 'Favour Nnaji', 'Female', '2003-01-31', 102),
(35, 'Desmond Eboh', 'Male', '2002-06-10', 103),
(36, 'Kemi Salami', 'Female', '2001-05-17', 104),
(37, 'Chuka Obi', 'Male', '2003-03-27', 101),
(38, 'Rachael Bassey', 'Female', '2002-09-01', 102),
(39, 'Henry Okoro', 'Male', '2001-11-06', 103),
(40, 'Adaora Ndu', 'Female', '2003-04-25', 104),
(41, 'Tope Akintola', 'Male', '2002-07-03', 101),
(42, 'Beatrice Enang', 'Female', '2003-08-30', 102),
(43, 'Olumide Ajayi', 'Male', '2002-01-19', 103),
(44, 'Vivian Okezie', 'Female', '2001-04-28', 104),
(45, 'Ahmed Sulaiman', 'Male', '2003-10-13', 101),
(46, 'Omolara Odu', 'Female', '2002-05-08', 102),
(47, 'Emmanuel Adigun', 'Male', '2001-03-12', 103),
(48, 'Juliet Nnamdi', 'Female', '2003-06-02', 104),
(49, 'Chris Eme', 'Male', '2002-08-22', 101),
(50, 'Precious Iyke', 'Female', '2001-12-30', 102);


-- Creation of Student Table
CREATE TABLE Departments (
		DepartmentID INT PRIMARY KEY,
        DepartmentName VARCHAR(50)
        );
        
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'Computer Science'),
(102, 'Mass Communication'),
(103, 'Mechanical Engineering'),
(104, 'Business Administration'),
(105, 'Electrical Engineering');

    
    CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES departments(DepartmentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

    
INSERT INTO Courses (CourseID, CourseName, DepartmentID) VALUES
(201, 'Introduction to Programming', 101),
(202, 'Data Structures and Algorithms', 101),
(203, 'News Writing and Reporting', 102),
(204, 'Broadcast Journalism', 102),
(205, 'Thermodynamics', 103),
(206, 'Fluid Mechanics', 103),
(207, 'Principles of Management', 104),
(208, 'Business Communication', 104),
(209, 'Circuit Analysis', 105),
(210, 'Digital Electronics', 105);


CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    UNIQUE (StudentID, CourseID) -- prevents enrolling the same student twice in the same course
);

    
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) VALUES
(1, 46, 204, '2025-01-04'),
(2, 46, 210, '2025-04-08'),
(3, 25, 209, '2025-03-24'),
(4, 29, 209, '2025-01-16'),
(5, 37, 204, '2025-05-20'),
(6, 17, 204, '2025-02-25'),
(7, 28, 210, '2025-05-18'),
(8, 27, 202, '2025-04-24'),
(9, 30, 201, '2025-04-09'),
(10, 50, 210, '2025-04-29'),
(11, 44, 203, '2025-04-02'),
(12, 32, 201, '2025-01-26'),
(13, 46, 206, '2025-01-19'),
(14, 49, 208, '2025-03-28'),
(15, 26, 206, '2025-01-28'),
(16, 29, 202, '2025-01-06'),
(17, 48, 209, '2025-04-02'),
(18, 40, 208, '2025-02-27'),
(19, 20, 208, '2025-04-15'),
(20, 21, 207, '2025-01-18'),
(21, 23, 204, '2025-05-19'),
(22, 3, 201, '2025-05-09'),
(23, 22, 208, '2025-01-01'),
(24, 23, 210, '2025-04-06'),
(25, 23, 207, '2025-05-12'),
(26, 17, 206, '2025-05-26'),
(27, 50, 206, '2025-01-03'),
(28, 27, 204, '2025-04-29'),
(29, 17, 209, '2025-02-10'),
(30, 11, 202, '2025-02-24'),
(31, 11, 208, '2025-03-20'),
(32, 24, 205, '2025-04-26'),
(33, 35, 202, '2025-02-06'),
(34, 35, 208, '2025-02-15'),
(35, 18, 201, '2025-03-19'),
(36, 25, 210, '2025-01-24'),
(37, 2, 210, '2025-01-16'),
(38, 7, 210, '2025-05-09'),
(39, 20, 201, '2025-05-26'),
(40, 34, 203, '2025-03-26'),
(41, 23, 209, '2025-01-30'),
(42, 36, 209, '2025-03-08'),
(43, 9, 204, '2025-04-27'),
(44, 5, 209, '2025-04-30'),
(45, 33, 201, '2025-03-10'),
(46, 8, 208, '2025-02-18'),
(47, 44, 201, '2025-05-23'),
(48, 19, 202, '2025-03-01'),
(49, 11, 201, '2025-02-24'),
(50, 13, 204, '2025-02-27');


CREATE TABLE Instructors (
  InstructorID INT PRIMARY KEY,
  `Name` VARCHAR(50),
  Gender VARCHAR(20),
  DepartmentID INT,
  Email VARCHAR(100),
  HireDate DATE,
  FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);


INSERT INTO instructors (InstructorID, Name, Gender, DepartmentID, Email, HireDate) VALUES
(1, 'Dr. Tunde Bakare', 'Male', 101, 'tbakare@university.edu', '2018-08-15'),
(2, 'Mrs. Grace Eze', 'Female', 102, 'geze@university.edu', '2017-07-10'),
(3, 'Engr. John Bello', 'Male', 103, 'jbello@university.edu', '2016-09-05'),
(4, 'Prof. Angela Okoro', 'Female', 104, 'aokoro@university.edu', '2015-06-21'),
(5, 'Dr. Uche Obi', 'Male', 105, 'uobi@university.edu', '2019-03-11'),
(6, 'Mrs. Amina Bello', 'Female', 101, 'abello@university.edu', '2020-01-23'),
(7, 'Dr. Samuel Nwachukwu', 'Male', 102, 'snwachukwu@university.edu', '2014-11-29'),
(8, 'Mrs. Halima Danjuma', 'Female', 103, 'hdanjuma@university.edu', '2013-04-18'),
(9, 'Dr. Femi Afolayan', 'Male', 104, 'fafolayan@university.edu', '2018-10-30'),
(10, 'Barr. Ifeoma Ndu', 'Female', 105, 'ifem.ndu@university.edu', '2016-12-03'),
(11, 'Dr. Chuka Eze', 'Male', 101, 'ceze@university.edu', '2017-02-27'),
(12, 'Mrs. Rachael Onu', 'Female', 102, 'ronu@university.edu', '2019-05-13'),
(13, 'Engr. Ibrahim Sule', 'Male', 103, 'isule@university.edu', '2020-08-09'),
(14, 'Mr. Joseph Bassey', 'Male', 104, 'jbassey@university.edu', '2018-01-04'),
(15, 'Dr. Juliet Oyibo', 'Female', 105, 'joyibo@university.edu', '2021-06-22'),
(16, 'Mr. Olumide Ajayi', 'Male', 101, 'oajayi@university.edu', '2022-02-10'),
(17, 'Ms. Omolara Eze', 'Female', 102, 'oeze@university.edu', '2020-09-15'),
(18, 'Dr. Victor Ibe', 'Male', 103, 'vibe@university.edu', '2015-11-17'),
(19, 'Mrs. Comfort Udo', 'Female', 104, 'cudo@university.edu', '2016-03-08'),
(20, 'Dr. Segun Oke', 'Male', 105, 'soke@university.edu', '2019-07-12');



-- Exploratory Data Analysis

-- How many students are enrolled in each course
SELECT CourseName, COUNT(StudentID) AS TotalStudents
FROM Courses c
RIGHT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY CourseName;

-- Which students are enrolled in multiple courses, and which courses are they taking?
SELECT StudentID
FROM Enrollments
GROUP BY StudentID
HAVING COUNT(DISTINCT CourseID > 1);
-- This is a list of students who enrolled in more than one course

SELECT 
    e.StudentID,
    s.`Name` AS StudentName,
    c.CourseID,
    c.CourseName
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE e.StudentID IN (
    SELECT StudentID
    FROM Enrollments
    GROUP BY StudentID
    HAVING COUNT(DISTINCT CourseID) > 1
)
ORDER BY e.StudentID, c.CourseID;

-- What is the total number of students per department across all courses? 
SELECT 
    s.DepartmentID, d.DepartmentName,
    COUNT(DISTINCT s.StudentID) AS TotalStudents
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Departments d ON s.DepartmentID = d.DepartmentID
GROUP BY s.DepartmentID
ORDER BY s.DepartmentID;

-- Which Course Has the Highest Enrollments
SELECT 
    c.CourseID,
    c.CourseName,
    COUNT(e.EnrollmentID) AS TotalEnrollments
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.CourseName
ORDER BY TotalEnrollments DESC;

-- Which department has the least number of students? 
SELECT
	d.DepartmentName,
    COUNT(s.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Students s on d.DepartmentID = s.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalStudents ASC;

-- Are there any students not enrolled in any course? 
SELECT 
    s.StudentID,
    s.`Name`,
    s.DepartmentID
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;

-- How many courses does each student take on average?
SELECT 
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT StudentID), 2) AS AverageCoursesPerStudent
FROM Enrollments;

-- Which course has the highest number of male or female students enrolled?
SELECT 
    c.CourseID,
    c.CourseName,
    s.Gender,
    COUNT(*) AS TotalEnrolled
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseID, c.CourseName, s.Gender
ORDER BY TotalEnrolled DESC
LIMIT 3;



