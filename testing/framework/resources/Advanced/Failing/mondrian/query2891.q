select time_by_day.the_year as c0, `position`.pay_type as c1, employee_closure.supervisor_id as c2, count(distinct salary.employee_id) as m0 from time_by_day as time_by_day, salary as salary,`position` as `position`, employee as employee, employee_closure as employee_closure where salary.pay_date = time_by_day.the_date and time_by_day.the_year = 1997 and salary.employee_id = employee.employee_id and employee.position_id = `position`.position_id and `position`.pay_type = 'Hourly' and salary.employee_id = employee_closure.employee_id and employee_closure.supervisor_id in (77, 125, 184, 191, 207, 283, 454, 538, 541, 606) group by time_by_day.the_year, `position`.pay_type, employee_closure.supervisor_id;
