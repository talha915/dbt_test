{{ config(materialized='view') }}

with source as (
    select * from {{ source('raw', 'order_items') }}
),

renamed as (
    select
       *
    from source
)

select * from renamed
