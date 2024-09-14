with users as (
    select 
        * 
    from 
        {{ ref('stg_users') }}
)

select 
    id,
    first_name,
    last_name,
    email,
    age,
    gender,
    street_address,
    postal_code,
    city,
    country,
    latitude,
    longitude,
    traffic_source,
    {{ time_travel('created_at') }} as created_at

from users