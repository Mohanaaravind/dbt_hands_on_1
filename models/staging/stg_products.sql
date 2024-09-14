select 
    id,
    cost,
    category,
    name,
    brand,
    round(retail_price,2) as retail_price,
    department,
    sku,
    distribution_center_id,
from {{ source('raw', 'products') }}