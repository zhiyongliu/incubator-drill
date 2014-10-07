select count(*) as c0 from (select distinct position.pay_type as c0 from employee as employee, position as position where employee.position_id = position.position_id) as init;
