with user_id_price as (
    select 
        user_id,
        sum(sale_price) as TotalAmountSpent
    from 
        {{ ref('cleaned_order_items') }}
    where
        status not in ('Cancelled','Returned')
    group by user_id

),

users as (
    select 
        id,
        first_name,
        last_name
    from {{ ref('stg_users') }}
),

final as (
    select 
        u.first_name,
        u.last_name,
        uip.TotalAmountSpent
    from 
        user_id_price uip
    join 
        users u
    on 
        u.id = uip.user_id
    order by 3 desc
    limit 5
    
)

select * from final

