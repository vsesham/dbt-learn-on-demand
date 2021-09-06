select 
    ID as payment_id,
    ORDERID,
    PAYMENTMETHOD,
    STATUS as PAYMENTSTATUS,
    AMOUNT/100 as AMOUNT,
    CREATED
from {{ source('stripe','payment') }}