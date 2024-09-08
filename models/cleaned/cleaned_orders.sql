select * from {{ ref('int_orders') }}
join
{{ ref('cleaned_order_items') }} 