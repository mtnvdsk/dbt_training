{% snapshot snap_customer_address %}
    {{
        config(
            target_schema='snap_july',
            target_database='database',
            unique_key='customer_id',
            strategy='timestamp',
            updated_at='updated_at'
        )
    }}

    select * from {{ source('stripe', 'customer_address') }}
 {% endsnapshot %}