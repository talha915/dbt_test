{{ config(materialized='view') }}

with order_details as (
    select * from {{ ref('int_order_details') }}
),

orders_summary as (
    select
        customer_id,
        first_name || ' ' || last_name as customer_name,
        count(distinct order_id) as total_orders,
        sum(item_total) as total_revenue,
        round(avg(item_total), 2) as avg_order_value
    from order_details
    group by customer_id, first_name, last_name
)

select * from orders_summary
