-- Create the UsuariosSC database
CREATE DATABASE solociencia;

-- Use the UsuariosSC database
USE solociencia;

-- Create the UserRegistry table
CREATE TABLE UserRegistry (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Password VARCHAR(100)
);

-- Create the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

-- Create the CourseRegistry table
CREATE TABLE CourseRegistry (
    UserID INT,
    CourseID INT,
    CourseDate VARCHAR(100),
    DisplayName VARCHAR(100),
    Cedula VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES UserRegistry(UserID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);



INSERT INTO Courses (CourseID, CourseName) VALUES
    ('001', 'Ciencias Naturales'),
    ('002', 'Quimica y Biologia'),
    ('003', 'Programacion');

