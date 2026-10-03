CREATE TABLE sales_data (
    Order_ID VARCHAR(50),
    Order_Date DATE,
    Customer_ID VARCHAR(50),
    Customer_Name VARCHAR(100),
    Age INTEGER,
    Gender VARCHAR(20),
    City VARCHAR(100),
    Product VARCHAR(100),
    Category VARCHAR(100),
    Quantity INTEGER,
    Unit_Price NUMERIC(10,2),
    Total_Sales NUMERIC(12,2)
);

SELECT *
FROM sales_data;

-- Total records check 
SELECT COUNT(*) AS total_orders
FROM sales_data;

-- Business Question 1
-- Top 5 products by revenue

SELECT 
    Product,
    SUM(Total_Sales) AS Total_Revenue
FROM sales_data
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 5;


-- Business Question 2
-- Which category generates the highest revenue?

SELECT 
    Category,
    SUM(Total_Sales) AS Total_Revenue
FROM sales_data
GROUP BY Category
ORDER BY Total_Revenue DESC;

--Business Question 3
--Which city generates the highest sales?

SELECT 
    City,
    SUM(Total_Sales) AS Total_Sales
FROM sales_data
GROUP BY City
ORDER BY Total_Sales DESC;

--Q4 Which product has the highest quantity sold?

SELECT 
    Product,
    SUM(Quantity) AS Total_Quantity
FROM sales_data
GROUP BY Product
ORDER BY Total_Quantity DESC;

--Q5 What is the average order value by category?

SELECT 
    Category,
    ROUND(AVG(Total_Sales), 2) AS Average_Order_Value
FROM sales_data
GROUP BY Category
ORDER BY Average_Order_Value DESC;

--Q6 What is the total revenue by gender?
SELECT 
    Gender,
    SUM(Total_Sales) AS Total_Revenue
FROM sales_data
GROUP BY Gender
ORDER BY Total_Revenue DESC;

--Q7 What is the monthly sales trend?

SELECT 
    EXTRACT(MONTH FROM Order_Date) AS Month,
    SUM(Total_Sales) AS Monthly_Sales
FROM sales_data
GROUP BY EXTRACT(MONTH FROM Order_Date)
ORDER BY Month;

-- Q8 Age 30 se greater customers ki sales

SELECT 
    Customer_Name,
    Age,
    Total_Sales
FROM sales_data
WHERE Age > 30
ORDER BY Total_Sales DESC;

-- Q9 Multiple conditions
SELECT 
    Product,
    Category,
    Total_Sales
FROM sales_data
WHERE Age > 30
AND Total_Sales > 1000
ORDER BY Total_Sales DESC;

-- top 5 products by revenue?

SELECT 
    Product,
    SUM(Total_Sales) AS Total_Revenue
FROM sales_data
GROUP BY Product
ORDER BY Total_Revenue DESC
LIMIT 5;