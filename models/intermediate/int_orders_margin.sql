SELECT
orders_id,
date_date,
revenue,
quantity,
purchase_cost,
margin
FROM {{ ref('int_sales_margin')}}