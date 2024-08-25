select 
    ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    AGE,
    GENDER,
    STREET_ADDRESS,
    POSTAL_CODE,
    CITY,
    COUNTRY,
    LATITUDE,
    LONGITUDE,
    TRAFFIC_SOURCE,
    replace(lower(created_at),'utc','') as created_at

from {{ source('raw', 'users') }}