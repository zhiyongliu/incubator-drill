select customer.education as c0 from customer as customer where UPPER(customer.education) = UPPER('Bacon') group by customer.education order by customer.education ASC NULLS LAST;
