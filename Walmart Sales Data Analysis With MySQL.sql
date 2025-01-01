CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);

select * from sales;
ALTER TABLE sales
DROP COLUMN time_of_day;


ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

-- For this to work turn off safe mode for update
-- Edit > Preferences > SQL Edito > scroll down and toggle safe mode
-- Reconnect to MySQL: Query > Reconnect to server
UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);
-- day name--
ALTER TABLE sales ADD COLUMN Day_Name VARCHAR(20);
update sales
set Day_Name =dayname(date);

-- month name--
ALTER TABLE sales ADD COLUMN Month_Name VARCHAR(20);
update sales
set Month_Name =monthname(date);

select date, Month_Name from sales;

-- --------------------------------------------------------------------
-- ---------------------------- Generic ------------------------------
-- --------------------------------------------------------------------
-- How many unique cities does the data have--
select distinct city
from sales;

select distinct city,branch from sales;

-- How many product does the data have--
select distinct product_line from sales;

-- What is the most common payment method?--
select distinct
payment,count(payment )as count
from sales
group by payment;

-- What is the most selling product line?--
select distinct product_line,
count(quantity) as Most_Selling_product
from sales
group by product_line
order by Most_Selling_product desc;



-- What is the total revenue by month?
select 
Month_Name as month,
sum(total) as totalRevenue
from sales
group by Month_Name
order by totalrevenue desc;

-- What month had the largest COGS?
SELECT
	month_name AS month,
	SUM(cogs) AS cogs
FROM sales
GROUP BY month_name 
ORDER BY cogs;



