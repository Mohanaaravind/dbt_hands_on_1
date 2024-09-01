with products as (
    select
        id,
        category
    from {{ ref('stg_products') }}
),

product_id_price as (
    select
        product_id,
        sale_price
    from
        {{ ref('cleaned_order_items') }}
    where
        status not in ('Cancelled','Returned')
),

final as (
    select
        p.category,
        sum(pip.sale_price) as TotalRevenue
    from
        product_id_price pip
    join 
        products p
    on
        p.id = pip.product_id

    group by 1
    order by 2 desc
    limit 5
)

select * from final