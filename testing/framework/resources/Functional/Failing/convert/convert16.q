select c_row, c_time, convert_from(convert_to(c_time, 'TIME_EPOCH_BE'), 'TIME_EPOCH_BE') from data;
