# Task_3-SQL-Data-Analysis
SQL Data Analysis

# Ecommerce SQL Data Analysis Project

## Objective
To perform data cleaning, transformation, and analysis on an ecommerce dataset using **MySQL**. The goal is to demonstrate proficiency with SQL queries including filtering, joining, subqueries, aggregate functions, views, and query optimization.

---

## Dataset Used

**Dataset Name:** [Ecommerce SQL Dataset (CSV format)]  
**Source:** [https://www.kaggle.com/datasets/carrie1/ecommerce-data]((https://www.kaggle.com/datasets/carrie1/ecommerce-data))

---

## Tools & Technologies
- MySQL Workbench
- SQL (MySQL dialect)

---

## What Was Done

### Data Cleaning
- Removed rows with:
  - Null or blank `CustomerID`
  - Invalid `UnitPrice` (non-numeric or negative)
  - `Quantity` less than or equal to 0
  - Empty `Description`

### Data Analysis
Used SQL queries involving:
- `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- Joins (INNER JOIN with mock CustomerDetails table)
- Subqueries (e.g., customers who purchased items above average price)
- Aggregate functions: `SUM`, `AVG`
- Views: Created view to display country-wise total sales
- Indexes: Created indexes on `CustomerID`, `InvoiceNo`, `Country` for query optimization


