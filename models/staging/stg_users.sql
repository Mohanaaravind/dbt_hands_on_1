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
    to_timestamp(replace(lower(created_at),'utc','')) as created_at

from {{ source('raw', 'users') }}