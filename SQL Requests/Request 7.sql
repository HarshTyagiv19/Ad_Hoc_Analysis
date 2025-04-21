/*7.  Get the complete report of the Gross sales amount for the customer  “Atliq 
Exclusive”  for each month  .  This analysis helps to  get an idea of low and 
high-performing months and take strategic decisions. 
The final report contains these columns: 
Month 
Year 
Gross sales Amount */


select concat(monthname(fs.date), '( ', year(fs.date)) as month
,fs.fiscal_year ,
round(sum(fs.sold_quantity*fa.gross_price),2) as gross_sales_amount
from fact_sales_monthly fs 
join fact_gross_price fa 
on fs.product_code=fa.product_code
join dim_customer c 
on c.customer_code=fs.customer_code
where c.customer = "Atliq Exclusive"
group by month,fs.fiscal_year
order by fs.fiscal_year