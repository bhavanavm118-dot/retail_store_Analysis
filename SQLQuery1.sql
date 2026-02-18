CREATE DATABASE RetailSalesDB;
GO

USE RetailSalesDB;
GO

-- Count total number of rows in the dataset
SELECT COUNT(*) AS Total_Rows
FROM superstore;

-- Calculate total revenue generated from all sales
SELECT SUM(Sales) AS Total_Sales
FROM superstore;

-- Calculate total profit earned
SELECT 
    SUM(Profit) AS Total_Profit
FROM superstore;

-- Profit Margin = (Total Profit / Total Sales) * 100
SELECT 
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) 
    AS Profit_Margin_Percentage
FROM superstore;

-- Calculate total number of products sold
SELECT 
    SUM(Quantity) AS Total_Quantity_Sold
FROM superstore;

-- Analyze which region generates the highest sales
SELECT 
    Region,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Analyze profitability of each product category
SELECT 
    Category,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Identify top and bottom performing sub-categories
SELECT 
    Sub_Category,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;

-- Analyze sales trend over time (Month-wise)
SELECT 
    FORMAT(Order_Date, 'yyyy-MM') AS Month,
    SUM(Sales) AS Monthly_Sales
FROM superstore
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Month;

-- Identify top 5 products generating highest profit
SELECT TOP 5
    Product_Name,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Product_Name
ORDER BY Total_Profit DESC;

-- Analyze how discount affects profitability
SELECT 
    Discount,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore
GROUP BY Discount
ORDER BY Discount;

-- Identify top customers contributing highest revenue
SELECT TOP 5
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM superstore
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;
