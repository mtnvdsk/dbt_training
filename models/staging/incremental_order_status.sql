{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

select * from {{ source('stripe', 'order_status') }}

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where status_changed_at > (select max(status_changed_at) from {{ this }}) 
{% endif %}

{#
1.materilized=  incremental
2. this model shoiuld be available at snowflake
3. is_incremental=true
#}