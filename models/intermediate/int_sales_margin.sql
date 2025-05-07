WITH 
source AS (
SELECT *
FROM {{ ref('stg_raw__sales')}}
join {{ ref('stg_raw__product')}}
USING(products_id)),

rename AS(
SELECT *,
quantity * CAST(purchse_price AS FLOAT64) AS purchase_cost
FROM source)

SELECT *,
revenue - purchase_cost AS margin
FROM rename