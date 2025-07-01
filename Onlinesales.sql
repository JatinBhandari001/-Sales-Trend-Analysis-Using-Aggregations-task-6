create database sales;

create table online_sales (
    order_id varchar(20) primary key,
    order_date date,
    customer_name varchar(100),
    amount decimal(10,2),
    product_id varchar(20)
);

## data imported through import wizard

select * from online_sales;

## Show order placed in Nov 2023
select * from online_sales
where order_date between "2023-11-01" and "2023-11-30";

#sum of total revenue genrated 
select sum(amount) as total_revenue
from online_sales; 

## count of unique orderid 
select count(distinct order_id) as Unique_orders
from online_sales;

##Top 3 Months by Revenue
select 
    extract(year from order_date) as year,
    extract(month from order_date) as month,
    sum(amount) as total_revenue
from     online_sales
group by extract(year from order_date),
         extract(month from order_date)
order by total_revenue desc
limit 3;

##Count unique orders by month and year
select extract(year from order_date) as year,
    extract(month from order_date) as month,
    count(distinct order_id) as unique_orders
from online_sales
group by
    extract(year from order_date),
    extract(month from order_date)
order by year, month;

##Monthly Revenue & Order Volume
select year(order_date) as year,
    extract(month from order_date) as month,
    sum(amount) as total_revenue,
    count(distinct order_id) as total_orders
from online_sales
group by year(order_date),
    extract(month from order_date)
order by year(order_date),
    extract(month from order_date);

##revenue by product
select product_id, 
    sum(amount) as total_revenue 
from online_sales 
group by product_id 
order by total_revenue desc
limit 3;

####################




