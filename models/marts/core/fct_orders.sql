with orders as
(
    select * from {{ref('stg_orders')}}
),
payments as
(
    select ORDERID as order_id, sum(case when PAYMENTSTATUS = 'success' then amount end) as amount from {{ref('stg_payments')}}
    group by order_id
),
final as
(
    select
        o.order_id,
        o.customer_id,
        p.amount
    from payments p
    inner join orders o on p.order_id = o.order_id
)
select * from final