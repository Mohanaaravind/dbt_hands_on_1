with orders as (
    select 
        *
    from 
        {{ ref('cleaned_orders') }}
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
    orders.num_of_item,
    order_count.num_of_item
from
    orders
join
    order_count
using
    (order_id)
where
    orders.num_of_item != order_count.num_of_item