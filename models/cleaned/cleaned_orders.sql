with orders as (
    select 
        *
    from 
        {{ ref('int_orders') }}
),

order_count as (
    select 
        count(*) as num_of_item,
        order_id
    from 
        {{ ref('cleaned_order_items') }}
    group by
        order_id
)

select

    orders.order_id,
    user_id,
    status,
    gender,
    created_at,
    returned_at,
    shipped_at,
    delivered_at,
    order_count.num_of_item as num_of_item
    
    
from orders
join order_count
on orders.order_id = order_count.order_id