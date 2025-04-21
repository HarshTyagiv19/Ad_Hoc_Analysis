/*10.  Get the Top 3 products in each division that have a high 
total_sold_quantity in the fiscal_year 2021? The final output contains these 
fields, 
division 
product_code 
product 
total_sold_quantity 
rank_order*/



with cte1 as(select 
p.division,
fs.product_code,
p.product,
sum(fs.sold_quantity) as total_sold_quantity
from fact_sales_monthly fs 
join dim_product p 
on p.product_code=fs.product_code
where fiscal_year = 2021
group by fs.product_code,p.division,p.product),
cte2 as (select *,
 RANK() OVER(PARTITION BY division ORDER BY Total_sold_quantity DESC) AS 'Rank_Order' 
from cte1)
select *
from cte2
where rank_order in (1,2,3)