{{
    config(
        materialized='table'
    )
}}

select 
    * 
from 
    {{ ref('cleaned_orders') }}

sample(0.008000)