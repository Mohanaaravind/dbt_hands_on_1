{%- set max_query -%}
    {% if not is_incremental() %}

        select max(order_id) + 1 as max from {{ ref('cleaned_orders') }}

    {% else %}

        select max(order_id) + 1 as max from {{ this }}

    {% endif %}

{%- endset -%}

{%- if execute -%}
    {% set result = run_query(max_query) %}
{%- endif -%}

{%- set seq_gen -%}
    CREATE OR REPLACE sequence {{ target.database }}.{{ target.schema }}.seq start {{ result.columns[0].values()[0] }}
{%- endset -%}

{%- do run_query(seq_gen) -%}

{{ config(materialized = 'incremental') }}

with cleaned_orders as (
    select * from {{ ref('cleaned_orders') }}
),

repeated_orders as (
    select * from {{ ref('repeated_orders') }}
)

{% if not is_incremental() %}

select
    *,
    '00000' as duplicated_from
from
    cleaned_orders

{% else %}  

select 
    {{ target.database }}.{{ target.schema }}.seq.nextval as order_id,
    user_id,
    status,
    gender,
    current_timestamp() as created_at,
    dateadd(second,datediff(second,returned_at,created_at),current_timestamp()) as returned_at,
    dateadd(second,datediff(second,shipped_at,created_at),current_timestamp()) as shipped_at,
    dateadd(second,datediff(second,delivered_at,created_at),current_timestamp()) as delivered_at,
    num_of_item,
    to_varchar(order_id) as duplicated_from
from
    repeated_orders

{% endif %}


