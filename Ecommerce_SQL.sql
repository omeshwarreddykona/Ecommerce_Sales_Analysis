-- Total Revenue
SELECT SUM(Total_Amount) AS Total_Revenue
FROM ecommerce;

-- Category-wise Revenue
SELECT Category, SUM(Total_Amount) AS Revenue
FROM ecommerce
GROUP BY Category
ORDER BY Revenue DESC;

-- Top 10 Products
SELECT Product, SUM(Total_Amount) AS Product_Revenue
FROM ecommerce
GROUP BY Product
ORDER BY Product_Revenue DESC
LIMIT 10;

-- Monthly Sales Trend
SELECT STRFTIME('%Y-%m', Order_Date) AS Month,
       SUM(Total_Amount) AS Monthly_Revenue
FROM ecommerce
GROUP BY Month
ORDER BY Month;
