
select

    order_id,
    user_id,
    status,
    gender,
    to_timestamp(replace(lower(created_at),'utc','')) as created_at,
    to_timestamp(replace(lower(returned_at),'utc','')) as returned_at,
    to_timestamp(replace(lower(shipped_at),'utc','')) as shipped_at,
    to_timestamp(replace(lower(delivered_at),'utc','')) as delivered_at,
    num_of_item
    
from {{ source('raw', 'orders') }}


