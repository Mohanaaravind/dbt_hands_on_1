{{
    config(
        materialized='table'
    )
}}

select

    order_id,
    user_id,
    status,
    gender,
    replace(lower(created_at),'utc','') as created_at,
    replace(lower(returned_at),'utc','') as returned_at,
    replace(lower(shipped_at),'utc','') as shipped_at,
    replace(lower(delivered_at),'utc','') as delivered_at,
    num_of_item
    
from {{ source('raw', 'orders') }}


