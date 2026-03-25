-- I want to see my table in the coding to start exploryting each column
SELECT *
FROM workspace.default.coffee_shop
LIMIT 10;

------------------------------------------------
-- 1. Checking the Date Range
-------------------------------------------------
-- They started collecting the data 2023-01-01
SELECT MIN(transaction_date) AS min_date 
FROM workspace.default.coffee_shop;
-- the duration of the data is 6 months
--  They last collected the data 2023-06-30

SELECT MAX(transaction_date) AS latest_date 
FROM workspace.default.coffee_shop;
-------------------------------------------------
-- 2. Checking the names of the different stores
------------------------------------------------
-- we have 3 stores and their names are Lower Manhattan, Hell's Kitchen, Astoria
SELECT DISTINCT store_location
FROM workspace.default.coffee_shop;

SELECT COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.coffee_shop;
-------------------------------------------------
-- 3. Checking products sold at our stores 
------------------------------------------------
SELECT DISTINCT product_category
FROM workspace.default.coffee_shop;

SELECT DISTINCT product_detail
FROM workspace.default.coffee_shop;

SELECT DISTINCT product_type
FROM workspace.default.coffee_shop;

SELECT DISTINCT product_category AS category,
                product_detail AS product_name
FROM workspace.default.coffee_shop;

-------------------------------------------------
-- 4. Checking product prices
------------------------------------------------
SELECT MIN(unit_price) As cheapest_price
FROM workspace.default.coffee_shop;

SELECT MAX(unit_price) As expensive_price
FROM workspace.default.coffee_shop;

------------------------------------------------
SELECT 
COUNT(*) AS number_of_rows,
      COUNT(DISTINCT transaction_id) AS number_of_sales,
      COUNT(DISTINCT product_id) AS number_of_products,
      COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.coffee_shop;
------------------------------------------------
SELECT *
FROM workspace.default.coffee_shop
LIMIT 10;

SELECT transaction_id,
      transaction_date,
      Dayname(transaction_date) AS Day_name,
      Monthname(transaction_date) AS Month_name,
      transaction_qty*unit_price AS revenue_per_tnx
FROM workspace.default.coffee_shop;
-----------------------------------------------------
SELECT COUNT(*)
FROM workspace.default.coffee_shop;


SELECT 
      transaction_date,
      Dayname(transaction_date) AS Day_name,
      Monthname(transaction_date) AS Month_name,
      COUNT(DISTINCT transaction_id) AS Number_of_sales,
      SUM(transaction_qty*unit_price) AS revenue_per_day
FROM workspace.default.coffee_shop
GROUP BY transaction_date,
         Day_name,
         Month_name;
------------------------------------------------------------
---DATA CLEANING 
SELECT 
      transaction_id,
      transaction_date,
      transaction_time,
      transaction_qty,
      store_id,
      store_location,
      unit_price,
      product_category,
      product_type,
      product_detail,
---Introducing New columns to enhance the data
---1st Column
      Dayname(transaction_date) AS Day_name,
---2nd Column
      Monthname(transaction_date) AS Month_name,
---3RD Column
      Dayofmonth(transaction_date) AS Date_of_month,
---4th Column(Weekend or Weekday)
      CASE
          WHEN Dayname(transaction_date) IN ('Sun','Sat') THEN 'Weekend'
          ELSE 'Weekday'
      END AS Day_classification,
---5th Column(Time Buckets)
CASE 
          WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '04:00:00' AND '11:59:59' THEN 'Morning'
          WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '12:00:00' AND '17:59:59' THEN 'Afternoon'
          WHEN date_format(transaction_time, 'HH:mm:ss') BETWEEN '18:00:00' AND '23:59:59' THEN 'Evening'
          ELSE 'Night'
      END AS Time_classification,
---6th Column Spend Buckets 
CASE 
          WHEN (transaction_qty*unit_price) <50 THEN 'Low Spender'
          WHEN (transaction_qty*unit_price) BETWEEN 51 AND 200 THEN 'Medium Spender'
          ELSE 'High Spender'
      END AS Spend_bucket,
---7th Column Revenue 
      transaction_qty*unit_price AS Revenue
      FROM workspace.default.coffee_shop;
