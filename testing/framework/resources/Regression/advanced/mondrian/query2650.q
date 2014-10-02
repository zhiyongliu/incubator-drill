select customer.state_province as c0 from customer as customer where (customer.country = 'Mexico') and UPPER(customer.state_province) = UPPER('Oaxaca') group by customer.state_province order by customer.state_province ASC NULLS LAST;
