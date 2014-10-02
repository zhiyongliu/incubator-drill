select employee.employee_id as c0, employee.last_name as c1, employee.full_name as c2, employee.first_name as c3 from employee as employee where employee.supervisor_id = 43 group by employee.employee_id, employee.last_name, employee.full_name, employee.first_name order by employee.last_name ASC NULLS LAST;
