select c_row, cast(c_varchar as varchar(10)), convert_from(convert_to(c_varchar, 'UTF8'), 'UTF8') from data;
