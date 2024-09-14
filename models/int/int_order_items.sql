with order_items as (
    select 
        * 
    from 
        {{ ref('stg_order_items') }}
)

select 
    id,
    order_id,
    user_id,
    product_id,
    status,
    {{ time_travel('created_at') }} as created_at,
    {{ time_travel('shipped_at','year',-1) }} as shipped_at,
    {{ time_travel('delivered_at','hour',300) }} as delivered_at,
    {{ time_travel('returned_at','month',3) }} as returned_at,
    sale_price

from order_items