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

-- What product line had the largest revenue?
select 
  product_line,
  sum(total) as total_revenue
  from sales
  group by product_line
  order by total_revenue desc;
  
  -- What is the city with the largest revenue?
  select 
  city,
  sum(total) as total_revenue
  from sales
  group by city
  order by total_revenue desc;
  
 -- What product line had the largest VAT?
select 
  product_line,
  AVG(tax_pct) as largestvat
  from sales
  group by product_line
  order by largestvat desc;
  
  -- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
  select 
  avg(quantity) as Average_sales
  from sales;
  
  select product_line,
  case
	when avg(quantity)>5.4 then "Good"
	else "Bad"
  end as remarks
  from sales
  group by product_line;
  
  -- Which branch sold more products than average product sold?
  select branch,
  sum(quantity) as qty
  from sales
  group by branch
  having qty>(select avg(quantity) from sales);
  
  
-- What is the most common product line by gender
select product_line,
count(gender) as  total_count
from sales
group by product_line,gender
order by total_count  desc;

-- What is the average rating of each product line
select product_line,
Round(avg(rating),1) as Average_Rating
from sales
group by product_line;
-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- -------------------------- Customers -------------------------------
-- --------------------------------------------------------------------

-- How many unique customer types does the data have?
select distinct customer_type from sales;

-- How many unique payment methods does the data have?
select distinct payment from sales;

-- What is the most common customer type?
select distinct customer_type
,count(customer_type) as common from sales
group by customer_type
order by common desc;

-- Which customer type buys the most?
select distinct customer_type,
count(*) from sales
group by customer_type
;

-- What is the gender distribution per branch?
SELECT 
    gender, COUNT(gender) AS count
FROM
    sales
WHERE
    branch = 'B'
GROUP BY gender;

-- Which time of the day do customers give most ratings?
select time_of_day,
avg(rating) as Average_rating
from sales
group by time_of_day;


-- Which time of the day do customers give most ratings per branch?
select time_of_day,
avg(rating) as Average_rating
from sales
where branch='C'
-- A and c are getting over all better ratings compared to B 
group by time_of_day;

-- What is the gender of most of the customers?
select distinct gender,
count(gender) as No_of_customer
from sales
group by gender;

-- Which day fo the week has the best avg ratings?
select distinct Day_Name,
round(avg(rating),2) as Average_rating
from sales
group by Day_Name;

-- Which day of the week has the best average ratings per branch?
select distinct Day_Name,
round(avg(rating),2) as Average_rating
from sales
where branch='B'
group by Day_Name;

-- --------------------------------------------------------------------
-- --------------------------------------------------------------------

-- --------------------------------------------------------------------
-- -------------------------- Sales -------------------------------
-- --------------------------------------------------------------------

-- Number of sales made in each time of the day per weekday
select time_of_day,
count(*) as per_day_sale
from sales
where day_Name='Sunday'
group by time_of_day
order by per_day_sale desc;
-- evening time the sale was better

-- Which of the customer types brings the most revenue?
select distinct customer_type,
sum(total) as total_revenue from sales
group by customer_type
order by total_revenue desc;

-- Which city has the largest tax percent/ VAT (Value Added Tax)
 select distinct city
 , sum(tax_pct) as Tax
 from sales
 group by city
 order by Tax desc;
 
 -- Which customer type pays the most in VAT?
 select distinct customer_type
 ,sum(tax_pct) as Tax
 from sales
 group by customer_type
 order by Tax Desc ;


