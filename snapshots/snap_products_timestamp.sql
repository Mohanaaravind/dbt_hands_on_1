{% snapshot snap_product_timestamp %}
    {{
        config(
            target_schema="dbt_ml",
            target_database="elook_commerce",
            unique_key="id",
            strategy="timestamp",
            invalidate_hard_deletes=True,
            updated_at="updated_at",
        )
    }}

    select *
    from {{ source("raw", "products") }}
{% endsnapshot %}

{% snapshot snap_product_retail_price %}
    {{
        config(
            target_schema="dbt_ml",
            target_database="elook_commerce",
            unique_key="id",
            strategy="check",
            invalidate_hard_deletes=True,
            check_cols=["retail_price"],
        )
    }}

    select id, cost, category, name, brand, retail_price
    from {{ source("raw", "products") }}
{% endsnapshot %}
