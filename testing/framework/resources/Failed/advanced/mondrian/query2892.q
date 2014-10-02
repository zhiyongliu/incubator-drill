select time_by_day.the_year as c0, employee_closure.supervisor_id as c1, count(distinct salary.employee_id) as m0 from time_by_day as time_by_day, salary as salary, employee_closure as employee_closure where salary.pay_date = time_by_day.the_date and time_by_day.the_year = 1997 and salary.employee_id = employee_closure.employee_id and employee_closure.supervisor_id in (6, 7, 10, 36, 54, 55, 56, 101, 102, 103, 162, 163, 164, 222, 226, 227, 228, 287, 288, 289, 359, 363, 364, 365, 424, 425, 426, 485, 486, 487, 546, 547, 548, 618, 622, 640, 641, 642, 713, 731, 749, 750, 751, 822, 823, 824, 882, 886, 887, 888, 947, 948, 949, 1020, 1021, 1022, 1067, 1068, 1069, 1140) group by time_by_day.the_year, employee_closure.supervisor_id;
