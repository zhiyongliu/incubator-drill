select distributor.distributor_id as c0, distributor.distributor_name as c1, line_class.line_class_id as c2, line_class.line_class_name as c3 from line as line, line_line_class as line_line_class, line_class as line_class, line_class_distributor as line_class_distributor, distributor as distributor where line_class_distributor.distributor_id = distributor.distributor_id and line_class.line_class_id = line_class_distributor.line_class_id and line_line_class.line_class_id = line_class.line_class_id and line.line_id = line_line_class.line_id group by distributor.distributor_id, distributor.distributor_name, line_class.line_class_id, line_class.line_class_name order by distributor.distributor_id ASC NULLS LAST, line_class.line_class_id ASC NULLS LAST;