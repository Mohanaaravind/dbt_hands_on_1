{{
    config(
        materialized='ephemeral'
    )
}}

select 
    id,
    order_id,
    user_id,
    product_id,
    status,
    replace(lower(created_at),'utc','') as created_at,
    replace(lower(shipped_at),'utc','') as shipped_at,
    replace(lower(delivered_at),'utc','') as delivered_at,
    replace(lower(returned_at),'utc','') as returned_at,
    sale_price

from {{ source('raw', 'order_items') }}