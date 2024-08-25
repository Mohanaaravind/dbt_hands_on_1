select
    id,
    order_id,
    user_id,
    product_id,
    s.Target_Status,
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
        {{ ref('stg_order_items') }}
    ) a

left join {{ ref('source_mapping') }} s
on a.status = s.Source_Status
where r=1
