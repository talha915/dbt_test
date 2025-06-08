{{ config(materialized='view') }}

with customers as (
    select * from {{ ref('stg_customer') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

order_details as (
    select
        o.order_id,
        o.order_date,
        o.customer_id,
        
        c.first_name,
        c.last_name,
        c.email,
        
        oi.order_item_id,
        oi.quantity,
        oi.unit_price,
        oi.quantity * oi.unit_price as item_total
    from orders o
    left join order_items oi on o.order_id = oi.order_id
    left join customers c on o.customer_id = c.customer_id
)

select * from order_details
