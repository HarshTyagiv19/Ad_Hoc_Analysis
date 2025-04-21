/*6.  Generate a report which contains the top 5 customers who received an 
average high  pre_invoice_discount_pct  for the  fiscal  year 2021  and in the 
Indian  market. The final output contains these fields, 
customer_code 
customer 
average_discount_percentage */



with cte1 as(
select customer_code as A, round(avg(pre_invoice_discount_pct),4) as B
from fact_pre_invoice_deductions 
where fiscal_year= 2021
group by customer_code),

cte2 as(
SELECT customer_code as e, customer as f 
from dim_customer 
where market = "India")
select cte1.a as customer_code,
cte2.f as customer,
cte1.b as average_dis_rating
from cte1,cte2
where cte1.a=cte2.e
order by average_dis_rating desc
limit 5