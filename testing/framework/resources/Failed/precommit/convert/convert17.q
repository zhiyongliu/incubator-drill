select c_row, c_time, convert_from(convert_to(c_time, 'TIME_EPOCH'), 'TIME_EPOCH') from data;
