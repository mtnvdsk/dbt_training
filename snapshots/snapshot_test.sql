{% snapshot orders_snapshot %}

{{
    config(
      target_database='analytics',
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      invalidation_hard_deletes=False,
      updated_at='updated_at_field',
    )
}}

select * from {{ source('jaffle_shop', 'orders') }}

{% endsnapshot %}