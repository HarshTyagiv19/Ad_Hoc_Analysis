/*4.  Follow-up: Which segment had the most increase in unique products in 
2021 vs 2020? The final output contains these fields, 
segment 
product_count_2020 
product_count_2021 
difference */



with cte1 as (
SELECT p.segment as A , count(distinct(f.product_code))as B
from
dim_product p , fact_sales_monthly f
where p.product_code = f.product_code
group by f.fiscal_year , p.segment
having f.fiscal_year = 2020),
cte2 as (

SELECT p.segment as c, count(distinct(f.product_code))as d
from
dim_product p , fact_sales_monthly f
where p.product_code = f.product_code
group by f.fiscal_year , p.segment
having f.fiscal_year = 2021)
select cte1.a as segment,
cte1.b as product_code_2020,
cte2.d as product_code_2021,
(cte2.d-cte1.b) as difference
from cte1,cte2
where cte1.a=cte2.c