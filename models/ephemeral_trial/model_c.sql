{{
    config(
        materialized='view'
    )
}}

select ((select a from {{ ref('model_b') }})
+
(select a from {{ ref('model_a') }})) as final