CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE ecommerce_data (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate VARCHAR(30),
    UnitPrice VARCHAR(20),
    CustomerID VARCHAR(20),
    Country VARCHAR(50)
);
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data.csv'
INTO TABLE ecommerce_data
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country);

CREATE TABLE ecommerce_data_cleaned AS
SELECT *
FROM ecommerce_data
WHERE 
    UnitPrice REGEXP '^[0-9]+(\.[0-9]{1,2})?$'
    AND Quantity > 0
    AND CustomerID IS NOT NULL
    AND TRIM(Description) != '';

SELECT *
FROM ecommerce_data_cleaned
ORDER BY UnitPrice DESC
LIMIT 10;

SELECT Country, AVG(UnitPrice) AS Avg_Price
FROM ecommerce_data_cleaned
GROUP BY Country
ORDER BY Avg_Price DESC;

SELECT Country, SUM(UnitPrice * Quantity) AS TotalSales
FROM ecommerce_data_cleaned
GROUP BY Country
ORDER BY TotalSales DESC;

CREATE TABLE CustomerDetails (CustomerID VARCHAR(20), CustomerName VARCHAR(50), Email VARCHAR(50));
SELECT ed.InvoiceNo, ed.CustomerID, cd.CustomerName
FROM ecommerce_data_cleaned ed
INNER JOIN CustomerDetails cd ON ed.CustomerID = cd.CustomerID;

SELECT DISTINCT CustomerID
FROM ecommerce_data_cleaned
WHERE UnitPrice > (
    SELECT AVG(UnitPrice)
    FROM ecommerce_data_cleaned
);

CREATE VIEW CountrySales AS
SELECT Country, SUM(UnitPrice * Quantity) AS TotalSales
FROM ecommerce_data_cleaned
GROUP BY Country;

SELECT * FROM CountrySales ORDER BY TotalSales DESC;

CREATE INDEX idx_customer ON ecommerce_data_cleaned(CustomerID);
CREATE INDEX idx_invoice ON ecommerce_data_cleaned(InvoiceNo);
CREATE INDEX idx_country ON ecommerce_data_cleaned(Country);
