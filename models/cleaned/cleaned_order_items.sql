select
    id,
    order_id,
    user_id,
    product_id,
    status,
    created_at,
    shipped_at,
    delivered_at,
    returned_at,
    sale_price
from
    (
        select 
            *, 
            rank() 
                over(partition by order_id,product_id order by created_at) as r 
        from
        {{ ref('int_order_items') }}
    ) a


where r=1
