<div align="center">

# 🚀 DATA TRANSFORMERS — SQL PROJECT

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=24&pause=1000&color=36BCF7&center=true&vCenter=true&width=700&lines=Welcome+to+Data+Transformers!;SQL+%7C+MySQL+%7C+Data+Analysis;Turning+Raw+Data+into+Useful+Insights" alt="Animated greeting" />

### 🗄️ A Practical MySQL Data Analysis & Query Project

**Database:** `DATATRANSFORMERS`  
**Technology:** MySQL  
**Focus:** Joins • Subqueries • Date Functions • String Functions • Window Functions • CASE Expressions

</div>

---

## 👋 Welcome!

Welcome to **Data Transformers**, a practical MySQL project designed to demonstrate how raw relational data can be transformed into meaningful information using SQL.

This project contains three main tables:

- 👤 **Customers** — customer registration and contact information
- 🛒 **Orders** — customer orders, dates, and transaction amounts
- 👨‍💼 **Employees** — employee departments, joining dates, and salaries

The project demonstrates **17 SQL concepts**, starting from basic table relationships and progressing to more advanced analytical queries such as **running totals, ranking, subqueries, date manipulation, string transformation, and conditional logic**.

---

## 🎯 Project Objectives

The main objectives of this project are to:

- Understand relational database design.
- Create and populate MySQL databases and tables.
- Work with **INNER, LEFT, RIGHT, and FULL OUTER JOIN logic**.
- Use **subqueries** for analytical comparisons.
- Extract and format date information.
- Clean and transform string data.
- Use **aggregate and window functions**.
- Generate running totals and rankings.
- Apply business rules using `CASE`.
- Analyze customer orders and employee salaries.

---

## 🏗️ Database Structure

```text
                    ┌─────────────────────┐
                    │      CUSTOMERS      │
                    ├─────────────────────┤
                    │ CustomerID (PK)     │
                    │ FirstName           │
                    │ LastName            │
                    │ Email               │
                    │ RegistrationDate    │
                    └──────────┬──────────┘
                               │
                               │ CustomerID
                               │
                    ┌──────────▼──────────┐
                    │       ORDERS        │
                    ├─────────────────────┤
                    │ OrderID (PK)        │
                    │ CustomerID (FK)     │
                    │ OrderDate           │
                    │ TotalAmount         │
                    └─────────────────────┘


                    ┌─────────────────────┐
                    │     EMPLOYEES       │
                    ├─────────────────────┤
                    │ EmployeeID (PK)     │
                    │ FirstName           │
                    │ LastName            │
                    │ Department          │
                    │ HireDate            │
                    │ Salary              │
                    └─────────────────────┘
```

### 🔑 Relationships

`Customers.CustomerID` → `Orders.CustomerID`

The `Orders` table uses `CustomerID` as a **foreign key**, connecting every order to its customer.

---

# 📊 SQL Concepts Covered

## 1️⃣ INNER JOIN

Retrieves customers who have matching orders.

```sql
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
```

**Purpose:** Combine related customer and order records.

---

## 2️⃣ LEFT JOIN

Returns all customers, including customers who may not have an order.

```sql
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
```

**Purpose:** Find customers with or without orders.

---

## 3️⃣ RIGHT JOIN

Returns all orders and matching customer information.

```sql
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
```

**Purpose:** Demonstrate right-side table preservation.

---

## 4️⃣ FULL OUTER JOIN — MySQL Workaround

MySQL does not directly support `FULL OUTER JOIN`.

This project combines `LEFT JOIN` and `RIGHT JOIN` using `UNION`.

```sql
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
```

**Purpose:** Simulate FULL OUTER JOIN behavior in MySQL.

---

## 5️⃣ Orders Above Average Amount

Uses a subquery to find orders whose amount is greater than the average order amount.

```sql
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
```

**Concept:** Subquery + `AVG()` + `INNER JOIN`

---

## 6️⃣ Employees Above Average Salary

Finds employees whose salary is greater than the company's average salary.

```sql
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
```

**Concept:** Subquery + aggregate function.

---

## 7️⃣ Extract Year and Month

Extracts year and month from each order date.

```sql
SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;
```

**Functions used:** `YEAR()` and `MONTH()`

---

## 8️⃣ Calculate Days Since Order

Calculates the number of days between an order date and the current date.

```sql
SELECT
    OrderID,
    OrderDate,
    CURRENT_DATE AS CurrentDate,
    DATEDIFF(CURRENT_DATE, OrderDate) AS DaysDifference
FROM Orders;
```

**Functions used:** `CURRENT_DATE` and `DATEDIFF()`

---

## 9️⃣ Format Order Date

Converts the date into a more readable format.

```sql
SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
FROM Orders;
```

**Example:** `2023-07-01` → `01-Jul-2023`

---

## 🔟 Concatenate Customer Name

Combines first name and last name into a single full name.

```sql
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;
```

**Function used:** `CONCAT()`

---

## 1️⃣1️⃣ Replace Text

Replaces the name `Rakesh` with `Rocky`.

```sql
SELECT
    FirstName,
    REPLACE(FirstName, 'Rakesh', 'Rocky') AS UpdatedFirstName
FROM Customers;
```

**Function used:** `REPLACE()`

---

## 1️⃣2️⃣ Uppercase & Lowercase

Transforms first names into uppercase and last names into lowercase.

```sql
SELECT
    CustomerID,
    UPPER(FirstName) AS FirstName_Upper,
    LOWER(LastName) AS LastName_Lower
FROM Customers;
```

**Functions used:** `UPPER()` and `LOWER()`

---

## 1️⃣3️⃣ Clean Email Data

Removes unnecessary spaces around email addresses.

```sql
SELECT
    CustomerID,
    Email,
    TRIM(Email) AS CleanEmail
FROM Customers;
```

**Function used:** `TRIM()`

> 💡 This is especially useful for basic data-cleaning tasks before analysis.

---

## 1️⃣4️⃣ Running Total

Calculates a cumulative total of order amounts.

```sql
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate, OrderID
    ) AS RunningTotal
FROM Orders;
```

**Concept:** Window function + cumulative aggregation.

---

## 1️⃣5️⃣ Rank Orders

Ranks orders from highest to lowest based on `TotalAmount`.

```sql
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;
```

**Concept:** Window function + ranking.

---

## 1️⃣6️⃣ Discount Classification

Assigns a discount category according to the order amount.

```sql
SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10%'
        WHEN TotalAmount > 500 THEN '5%'
        ELSE '0%'
    END AS Discount
FROM Orders;
```

### 💰 Business Rule

| Order Amount | Discount |
|---:|---:|
| > 1000 | 10% |
| > 500 | 5% |
| 500 or below | 0% |

---

## 1️⃣7️⃣ Employee Salary Category

Classifies employees according to salary.

```sql
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
```

### 💼 Salary Rules

| Salary | Category |
|---:|---|
| ≥ 80,000 | High |
| ≥ 60,000 | Medium |
| < 60,000 | Low |

---

# 🧪 Sample Dataset

## 👤 Customers

| ID | Name | Email |
|---:|---|---|
| 1 | Rakesh Pedduri | rakesh.pedduri@gmail.com |
| 2 | Yash Pandey | yash.pandey@com |
| 3 | Kalpesh Patil | kalpesh.patil@gmail.com |
| 4 | Kunal Rajput | kunal.rajuput@gmail.com |
| 5 | Jiya Patel | jiya.patel@gmail.com |

## 🛒 Orders

| Order ID | Customer ID | Order Date | Amount |
|---:|---:|---|---:|
| 101 | 1 | 2023-07-01 | 150.50 |
| 102 | 2 | 2023-07-03 | 200.75 |
| 103 | 1 | 2023-07-10 | 750.00 |
| 104 | 3 | 2023-08-15 | 1200.00 |
| 105 | 4 | 2023-09-01 | 450.25 |
| 106 | 2 | 2023-09-15 | 650.00 |
| 107 | 3 | 2023-10-05 | 1100.00 |

## 👨‍💼 Employees

| ID | Name | Department | Salary |
|---:|---|---|---:|
| 1 | Suraj Mahato | Sales | 60,000 |
| 2 | Pravin Sirvi | HR | 55,000 |
| 3 | Ronak Khatik | IT | 80,000 |
| 4 | Shivam Verma | Finance | 70,000 |
| 5 | Vikas Sharma | Sales | 95,000 |



# 🏆 Project Highlights

| Area | Covered |
|---|:---:|
| Database Creation | ✅ |
| Table Design | ✅ |
| Sample Data | ✅ |
| Primary & Foreign Keys | ✅ |
| Joins | ✅ |
| Subqueries | ✅ |
| Date Functions | ✅ |
| String Functions | ✅ |
| Data Cleaning | ✅ |
| Window Functions | ✅ |
| Ranking | ✅ |
| Running Total | ✅ |
| CASE Statements | ✅ |
| Business Rules | ✅ |





# 👨‍💻 Author

<div align="center">

### **Kalpesh Patil**

**SQL • MySQL • Data Analysis • Database Projects**

Built as a practical SQL project to demonstrate relational database querying, data transformation, and analytical SQL techniques.

</div>

---

<div align="center">

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=22&pause=1000&color=36BCF7&center=true&vCenter=true&width=700&lines=Thanks+for+visiting+Data+Transformers!;Keep+Learning+%7C+Keep+Building+%7C+Keep+Transforming+Data!;See+you+in+the+next+SQL+project+%F0%9F%9A%80" alt="Animated closing message" />

### ⭐ If you found this project useful, give it a star!

**END OF DATA TRANSFORMERS PROJECT** 🚀

</div>
