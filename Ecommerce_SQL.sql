/* ------------------------------------------
   E-COMMERCE SALES ANALYSIS SQL SCRIPT
   Author: Kona Omeshwar Reddy
   ------------------------------------------ */

/* 
   STEP 1 — CREATE TABLE 
   (Run this BEFORE inserting data)
*/

CREATE TABLE ecommerce (
    Order_ID INT,
    Product VARCHAR(50),
    Category VARCHAR(50),
    Unit_Price INT,
    Quantity INT,
    Total_Amount INT,
    Order_Date DATE,
    City VARCHAR(50),
    Payment_Method VARCHAR(20)
);

/* 
   STEP 2 — INSERT DATA
   You can import CSV using database UI
   or use bulk import commands.
*/

/* ------------------------------------------
   STEP 3 — ANALYSIS QUERIES
   ------------------------------------------ */

/* 1. Total Revenue */
SELECT 
    SUM(Total_Amount) AS Total_Revenue
FROM ecommerce;

/* 2. Revenue by Category */
SELECT 
    Category,
    SUM(Total_Amount) AS Category_Revenue
FROM ecommerce
GROUP BY Category
ORDER BY Category_Revenue DESC;

/* 3. Top 10 Best-Selling Products */
SELECT 
    Product,
    SUM(Total_Amount) AS Product_Revenue
FROM ecommerce
GROUP BY Product
ORDER BY Product_Revenue DESC
LIMIT 10;

/* 4. Monthly Sales Trend */
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Total_Amount) AS Monthly_Revenue
FROM ecommerce
GROUP BY Month
ORDER BY Month;
