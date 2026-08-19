REATE DATABASE DATATRANSFORMERS;

USE DATATRANSFORMERS;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, RegistrationDate)
VALUES
(1, 'rakesh', 'pedduri', ' rakesh.pedduri@gmail.com ', '2023-06-15'),
(2, 'yash', 'pandey', 'yash.pandey@com', '2023-07-01'),
(3, 'kalpesh', 'patil', 'kalpesh.patil@gmail.com', '2023-07-10'),
(4, 'kunal', 'rajput', 'kunal.rajuput@gmail.com', '2023-08-05'),
(5, 'jiya', 'patel', 'jiya.patel@gmail.com', '2023-08-20');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);



INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-07-10', 750.00),
(104, 3, '2023-08-15', 1200.00),
(105, 4, '2023-09-01', 450.25),
(106, 2, '2023-09-15', 650.00),
(107, 3, '2023-10-05', 1100.00);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);


INSERT INTO Employees
(EmployeeID, FirstName, LastName, Department, HireDate, Salary)
VALUES
(1, 'suraj', 'mahato', 'Sales', '2020-01-15', 60000),
(2, 'pravin', 'sirvi', 'HR', '2021-03-20', 55000),
(3, 'ronak', 'khatik', 'IT', '2019-07-10', 80000),
(4, 'shivam', 'verma', 'Finance', '2022-05-25', 70000),
(5, 'vikas', 'sharma', 'Sales', '2018-11-01', 95000);

SHOW TABLES;

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Employees;