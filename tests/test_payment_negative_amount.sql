{{
    config(
        store_failures=true
    )
}}

select * from {{ ref('stg_payment') }} where amount=1700