WITH 
source AS (
SELECT *
FROM {{ ref('stg_raw__sales')}}
join {{ ref('stg_raw__product')}}
USING(products_id)),

rename AS(
SELECT *,
ROUND(quantity * CAST(purchse_price AS FLOAT64),2) AS purchase_cost
FROM source)

SELECT *,
ROUND(revenue - purchase_cost, 2) AS margin
FROM rename