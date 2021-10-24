--Total sales
select 
       sum(sales)as total_sales
from   orders o

--Total profit
select
      sum (profit) as total_profit
from  orders o 

--Profit ratio
select  
      sum (profit)/sum(sales)*100 
      as total_profit
from  orders o 


--Profit per order
select
       sum(profit)/count(distinct order_id) 
       as sale_per_order
from   orders o 

--Sales per customer
select
         customer_id,customer_name,
         round(sum(sales),0) as total_sales
from     orders o 
group by customer_id ,customer_name 
order by total_sales asc ;

--Average discount
select
        AVG(discount) as avg_discount
from    orders o 

--Monthly sales by segment 
select     
           segment,
           extract(year from order_date) as sale_year,
           extract( month from order_date) as sale_month,
           round(sum(sales),2) as sales
from       orders o 
group by   segment,sale_year,sale_month
order by   sale_year,sale_month;


--Monthly sales by category
select   
         category,
         extract(year from order_date) as sale_year,
         extract(month from order_date)as sale_month,
         round(sum(sales),2) as sales
from     orders o 
group by extract(year from order_date),
         extract(month from order_date),
         category
order by sale_year,sale_month;       
        

--Sales and profit by customer
select 
         customer_name, customer_id,
         round(sum(sales),2) as total_sales,
         round(sum(profit),2)as total_profit
from     orders o 
group by customer_name,customer_id ;

--Customer ranking
select 
         customer_name,customer_id, 
         sum(sales) as total_sales
from     orders o 
group by customer_name,customer_id 
order by total_sales DESC;

--Sales per region
select
         region,
         sum(sales) as total_sales
from orders o 
group by region; 

      