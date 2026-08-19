USE DATATRANSFORMERS;

-- =====================================================
-- DATA TRANSFORMER - SQL PROJECT
-- =====================================================

-- 1. INNER JOIN
SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email
FROM Orders o
INNER JOIN Customers c
    ON o.CustomerID = c.CustomerID;

-- 2. LEFT JOIN
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- 3. RIGHT JOIN
SELECT
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- 4. FULL OUTER JOIN
-- MySQL does not directly support FULL OUTER JOIN
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID

UNION

SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM Customers c
RIGHT JOIN Orders o
    ON c.CustomerID = o.CustomerID;

-- 5. Customers having orders above average amount
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.TotalAmount
FROM Customers c
INNER JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.TotalAmount > (
    SELECT AVG(TotalAmount)
    FROM Orders
);

-- 6. Employees above average salary
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Department,
    Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

-- 7. Extract Year and Month
SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;

-- 8. Difference between OrderDate and Current Date
SELECT
    OrderID,
    OrderDate,
    CURRENT_DATE AS CurrentDate,
    DATEDIFF(CURRENT_DATE, OrderDate) AS DaysDifference
FROM Orders;

-- 9. Format OrderDate
SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
FROM Orders;

-- 10. Concatenate FirstName and LastName
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;

-- 11. Replace part of string
SELECT
    FirstName,
    REPLACE(FirstName, 'Rakesh', 'Rocky') AS UpdatedFirstName
FROM Customers;

-- 12. Uppercase FirstName and lowercase LastName
SELECT
    CustomerID,
    UPPER(FirstName) AS FirstName_Upper,
    LOWER(LastName) AS LastName_Lower
FROM Customers;

-- 13. Trim spaces from Email
SELECT
    CustomerID,
    Email,
    TRIM(Email) AS CleanEmail
FROM Customers;

-- 14. Running Total
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
    ) AS RunningTotal
FROM Orders;

-- 15. Rank Orders
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;

-- 16. Discount based on TotalAmount
SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10%'
        WHEN TotalAmount > 500 THEN '5%'
        ELSE '0%'
    END AS Discount
FROM Orders;

-- 17. Employee Salary Category
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    CASE
        WHEN Salary >= 80000 THEN 'High'
        WHEN Salary >= 60000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;