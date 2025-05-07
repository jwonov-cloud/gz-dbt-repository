WITH source AS (
SELECT *
FROM {{ref("int_orders_margin")}}
JOIN {{ref("stg_raw__ship")}}
USING(orders_id)),

renamed AS (
SELECT *,
ROUND((margin + shipping_fee) - (logcost + ship_cost),2) AS operational_margin
FROM source)

SELECT
*
FROM renamed