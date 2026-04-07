Use retail;

select top 5 * from dbo.online_retail_II_2009;

-- data quality check 
select 
	count(*) as total_rows,
	sum(case when Customer_ID is null then 1 else 0 end) as null_customer,
	sum(case when Description is null then 1 else 0 end) as null_description,
	sum(case when Quantity <= 0 then 1 else 0 end) as non_positive_quantity,
	sum(case when Price <= 0 then 1 else 0 end) as non_positive_price,
	sum(case when Invoice like 'C%' then 1 else 0 end) as cancelled_rows
from dbo.online_retail_II_2009;

select top 1 * from dbo.online_retail_II_2009;

-- filter data into new table 
drop table if exists dbo.clean_2009;
select Invoice, StockCode, Description, Quantity, 
	try_convert(datetime, InvoiceDate, 112) as InvoiceDate,
	cast(Price as decimal(10, 2)) as Price,
	Customer_ID, Country,
	cast(Quantity * Price as decimal (18, 4)) as Revenue
into dbo.clean_2009
from dbo.online_retail_II_2009
where Customer_ID is not null
	and Invoice not like 'C%'
	and Quantity > 0 
	and Price > 0;

select 
	count(*) as total_rows,
	sum(case when Customer_ID is null then 1 else 0 end) as null_customer,
	sum(case when Description is null then 1 else 0 end) as null_description,
	sum(case when Quantity <= 0 then 1 else 0 end) as non_positive_quantity,
	sum(case when Price <= 0 then 1 else 0 end) as non_positive_price,
	sum(case when Invoice like 'C%' then 1 else 0 end) as cancelled_rows
from dbo.clean_2009;

 -- kpi queries
select 
	count(*) as total_transactions,
	count(distinct Invoice) as total_orders,
	count(distinct Customer_ID) as total_customers,
	sum(Revenue) as total_revenue,
	avg(Revenue) as avg_revenue
from dbo.clean_2009;

-- monthly sales
select year(InvoiceDate) as order_year,
	month(InvoiceDate) as order_month,
	sum(Revenue) as monthly_revenue,
	count(distinct (Invoice)) as total_orders
from dbo.clean_2009
where InvoiceDate is not null
group by year(InvoiceDate), month(InvoiceDate)
order by order_year, order_month;

-- top 10 countries based on revenue
select top 10
	Country,
	Sum(Revenue) as total_revenue,
	Count(Distinct Invoice) as total_orders,
	Count(Distinct Customer_ID) as total_customers
from dbo.clean_2009
group by Country
order by total_revenue desc;

-- top 10 products based on revenue 
select top 10
	StockCode,
	Sum(Quantity) as total_quantity_sold,
	Sum(Revenue) as total_revenue
from dbo.clean_2009
group by StockCode
order by total_revenue desc;

-- top 10 customers based on revenue
select top 10
	Customer_ID,
	Count(distinct Invoice) as total_orders,
	Sum(quantity) as total_quantity,
	Sum(revenue) as total_revenue
from dbo.clean_2009
group by Customer_ID
order by total_revenue desc;
	
-- customer return
with customer_orders as
(
	select
		Customer_ID,
		Count(distinct Invoice) as order_count
	from dbo.clean_2009
	group by Customer_ID
)
select
	count(*) as total_customers,
	sum(case when order_count > 1 then 1 else 0 end) as repeat_customers,
	cast(100.0 * sum(case when order_count > 1 then 1 else 0 end) / count(*) as decimal(10, 2)) as repeat_rate
from customer_orders;

-- sales by hour analysis
select
	datepart(hour, InvoiceDate) as order_hour,
	count(distinct Invoice) as total_orders,
	sum(Revenue) as total_revenue
from dbo.clean_2009
group by datepart(hour, InvoiceDate)
order by order_hour;