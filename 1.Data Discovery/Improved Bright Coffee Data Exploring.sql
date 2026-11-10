
---VIEWING GIVEN TABLE IN CODING ENVIRONMENT TO START EXPLORING 
SELECT *
FROM workspace.default.bright_coffee_shop_analysis_case_study_1
LIMIT 10;

--------------------------------------------
---CHECKING DATE RANGE
--------------------------------------------
---They started collecting the data 2023-01-01
SELECT MIN(transaction_date) AS min_date
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;
--------------------------------------------
---The duration of the data is 6 months 
---They stopped collecting the data 2023-06-30
SELECT MAX(transaction_date) AS latest_date
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;
--------------------------------------------
---2Checking the names of the different stores 
--------------------------------------------
---we have 3 stores and their names are Lower Manhattan,Hell's Kitchen,Astoria
SELECT DISTINCT store_location
FROM workspace.default.bright_coffee_shop_analysis_case_study_1
--------------------------------------------
---3 Checking products  sold at our stores
Select DISTINCT product_category
FROM workspace.default.bright_coffee_shop_analysis_case_study_1

SELECT DISTINCT product_category AS category
                product_detail AS product_name
FROM workspace.default.bright_coffee_shop_analysis_case_study_1

SELECT DISTINCT product_type
FROM workspace.default.bright_coffee_shop_analysis_case_study_1
--------------------------------------------------------------
---Checking the prices
--------------------------------------------------------------
---Cheapest is 0.8 and most expensive is 45.0
select MIN(unit_price) AS cheapest_price 
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;

select MAX(unit_price) AS expensiv_price 
FROM workspace.default.bright_coffee_shop_analysis_case_study_1

---------------------------------------------------------------
SELECT Count(*) AS number_of_rows
      Count(DISTINCT transaction_id) AS number_of_sales
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;
---------------------------------------------------------------
SELECT COUNT(*) AS number_of_rows
      COUNT(DISTINCT transaction_id) AS number_of_sales,
      COUNT(DISTINCT product_id) AS number_of_products,
      COUNT(DISTINCT store_id) AS number_of_stores
FROM workspace.default.bright_coffee_shop_analysis_case_study_1;


--Here are the tables in the current editor:
--Table name: workspace.default.bright_coffee_shop_analysis_case_study_1 (Created by the file upload UI),
