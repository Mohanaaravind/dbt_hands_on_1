with orders as (
    select 
        * 
    from 
        {{ ref('stg_orders') }}
)

select

    order_id,
    user_id,
    status,
    gender,
    {{ time_travel('created_at') }} as created_at,
    {{ time_travel('returned_at','month',3) }} as returned_at,
    {{ time_travel('shipped_at','year',-1) }} as shipped_at,
    {{ time_travel('delivered_at','hour',300) }} as delivered_at,
    num_of_item
    
from orders