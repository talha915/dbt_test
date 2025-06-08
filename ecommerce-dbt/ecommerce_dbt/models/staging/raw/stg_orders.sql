{{ config(materialized='view') }}

with source as (
    select * from {{ source('raw', 'orders') }}
),


renamed as (
    select * from source
)

select * from renamed
