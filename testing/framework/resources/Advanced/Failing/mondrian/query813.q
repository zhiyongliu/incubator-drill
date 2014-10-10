select customer.yearly_income as c0, customer.education as c1 from customer as customer, sales_fact_1997 as sales_fact_1997 where sales_fact_1997.customer_id = customer.customer_id and ((not (customer.yearly_income in ('$10K - $30K', '$50K - $70K')) or (customer.yearly_income is null))) group by customer.yearly_income, customer.education order by customer.yearly_income ASC NULLS LAST, customer.education ASC NULLS LAST;