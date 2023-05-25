CREATE DATABASE Employee_Tracking_System

USE Employee_Tracking_System

CREATE TABLE Department
(
    DeptID char(7) NOT NULL PRIMARY KEY,
    DeptName NVARCHAR(70) NOT NULL,
    DeptInfo NVARCHAR(255) NOT NULL,
    DeptManager NVARCHAR(30)NOT NULL,
);

CREATE TABLE Service
(
    RouteID INT IDENTITY(1,1) PRIMARY KEY,
    NumberPlate NVARCHAR(11) NOT NULL,
    DepartureTime DATETIME NOT NULL,
    DriverName NVARCHAR(30) NOT NULL,
    NumberOfSeats TINYINT NOT NULL,
    Route NVARCHAR(255) NOT NULL,
);

CREATE TABLE Role
(
    RoleID char(7) NOT NULL PRIMARY KEY,
    RoleName NVARCHAR(30) NOT NULL,
    RoleDesc NVARCHAR(255) NOT NULL,
);

CREATE TABLE Employee
(
    TCKN char(11) NOT NULL PRIMARY KEY,
    FirstName NVARCHAR(30) NOT NULL,
    Minit NVARCHAR(30),
    LastName NVARCHAR(30) NOT NULL,
    Gender Char NOT NULL,
    BirthDate DATE NOT NULL,--Generate age using birthdate on front
    Address NVARCHAR(MAX) NOT NULL,
    PhoneNumber VARCHAR(11) NOT NULL,
    NumberOfPermits TINYINT NOT NULL,
    Salary MONEY NOT NULL,
    StartDate DATE NOT NULL,--the date employee started at the company
    DepartureDate DATE,
    DeptID char(7) NOT NULL,
    RouteID INT NOT NULL,
    RoleID char(7) NOT NULL,
    CONSTRAINT FK_DeptID FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    CONSTRAINT FK_RouteID FOREIGN KEY (RouteID) REFERENCES Service(RouteID),
    CONSTRAINT FK_RoleID FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
);

CREATE TABLE EmpDept
(
    TCKN CHAR(11) NOT NULL,
    DeptID CHAR(7) NOT NULL,
    DeptStartDate DATE NOT NULL,--date the employee started the Department
    DeptDepartureDate DATE,
    CONSTRAINT PK_EmpDept PRIMARY KEY (TCKN,DeptID),
    CONSTRAINT FK_EmpDeptDeptID FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    CONSTRAINT FK_EmpDeptTCKN FOREIGN KEY (TCKN) REFERENCES Employee(TCKN),
);

CREATE TABLE Permission
(
    PermID INT IDENTITY(1,1) PRIMARY KEY,
    PermType NVARCHAR(30) NOT NULL,
    PermStartDate DATE NOT NULL,
    PermEndDate DATE,
    TCKN CHAR (11) NOT NULL,
    CONSTRAINT FK_PermTCKN FOREIGN KEY (TCKN) REFERENCES Employee(TCKN),
);

CREATE TABLE TimeLog
(
    LoginID INT IDENTITY(1,1) PRIMARY KEY,
    TCKN CHAR (11) NOT NULL,
    LoginDateTime DATETIME NOT NULL,--entry to the study
    OutDateTime DATETIME,
    CONSTRAINT FK_TimeLogTCKN FOREIGN KEY (TCKN) REFERENCES Employee(TCKN),
);

CREATE TABLE Payment
(
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    TCKN CHAR(11) NOT NULL,
    AmountOfPayment DATE NOT NULL,
    PaymentDate DATE NOT NULL,
    CONSTRAINT FK_PaymentTCKN FOREIGN KEY (TCKN) REFERENCES Employee(TCKN),
);

CREATE TABLE EmpEmail
(
    TCKN char(11) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_EmpEmail PRIMARY KEY (TCKN,Email),
    CONSTRAINT FK_EmpEmailTCKN FOREIGN KEY (TCKN) REFERENCES Employee(TCKN),
);