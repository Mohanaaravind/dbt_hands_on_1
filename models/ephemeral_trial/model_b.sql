{{
    config(
        materialized='ephemeral'
    )
}}

select a+1 as a from {{ ref('model_a') }}