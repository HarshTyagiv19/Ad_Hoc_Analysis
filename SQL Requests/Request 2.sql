/*2.  What is the percentage of unique product increase in 2021 vs. 2020? The 
final output contains these fields, 
unique_products_2020 
unique_products_2021 
percentage_chg */

select x.a as unique_product_2020,
       y.b as unique_product_2021,
       round((b-a)/A*100,2) as percent_change
       from
(
(select count(distinct(product_code)) as A 
from fact_sales_monthly
where fiscal_year =2020) x ,

(select count(distinct(product_code)) as B 
from fact_sales_monthly
where fiscal_year = 2021)y
)
