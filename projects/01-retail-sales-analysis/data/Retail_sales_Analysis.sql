create table retail_sales(
			transactions_id	int primary key,
			sale_date date,
			sale_time	time,
			customer_id	int,
			gender	varchar(10),
			age	int,
			category varchar(20),	
			quantiy	int,
			price_per_unit float,	
			cogs	float,
			total_sale float

)

select count(*) from retail_sales
where transactions_id is null or
			sale_date isnull or 
			sale_time	isnull or
			customer_id	isnull or
			gender	isnull or
			age	isnull or 
			category isnull or 	
			quantiy	isnull or
			price_per_unit isnull or	
			cogs	isnull or
			total_sale isnull;

delete from retail_sales 
where transactions_id is null or
			sale_date isnull or 
			sale_time	isnull or
			customer_id	isnull or
			gender	isnull or
			age	isnull or 
			category isnull or 	
			quantiy	isnull or
			price_per_unit isnull or	
			cogs	isnull or
			total_sale isnull;

--Data Exploration
--Total number of Sales
select count(transactions_id) from retail_sales

--How many number of Customers do we have 
select count( distinct customer_id) from retail_sales

--Data Analysis
--Sales made on 2022-11-05
select * from retail_sales where sale_date='2022-11-05'

--No of transactions in Clothing category with more than 10 quantitity in Nov,2022
select * from retail_sales where category like 'Clothing' and quantiy >10 and sale_date between '2022-11-01' and '2022-11-30'

--Total sale for each category
select category,sum(total_sale) from retail_sales group by category

--Average age of customers who bought beauty products
 select * from retail_sales where category like 'Clothing' and quantiy >10 and sale_date between 2022-11-01 and 2022-11-30 

 --High value sales
 select * from retail_sales where total_sale > 1000

 --sales made by gender in each category
 select distinct category,gender,count(total_sale) from retail_sales group by gender,category

 --avg sale for each month
 select date_part('month',sale_date) as Month,avg(total_sale) as Average_Sale from retail_sales group by date_part('month',sale_date)
 order by date_part('month',sale_date)