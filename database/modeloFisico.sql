CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Password VARCHAR(100)
);

-- Create the CoursesType table
CREATE TABLE Course_Type (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

-- Create the Course table
CREATE TABLE course_registry (
    UserID INT,
    CourseID INT,
    CourseDate VARCHAR(100),
    DisplayName VARCHAR(100),
    Cedula VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (CourseID) REFERENCES Course_Type(CourseID)
);



INSERT INTO Course_Type (CourseID, CourseName) VALUES
    ('001', 'Ciencias Naturales'),
    ('002', 'Quimica y Biologia'),
    ('003', 'Programacion');
