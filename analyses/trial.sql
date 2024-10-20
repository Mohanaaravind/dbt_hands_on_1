{#{% set relations = dbt_utils.get_relations_by_prefix(schema='shared_data',prefix='',database='snowplow_digital_analytics') %}
{% for relation in relations %}
    select 
        '{{ relation.identifier }}' as table_name,
        (select count(*) from {{ relation }}) as c
        {%- if not loop.last %}
        union all
        {% endif -%}
{%- endfor %}#}

{% set query %}
    select max(order_id) + 1 from {{ ref('cleaned_orders') }}
{% endset %}

{% set start=run_query(query) %}

select {{ start }}