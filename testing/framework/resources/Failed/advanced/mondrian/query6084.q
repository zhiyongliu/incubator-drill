select agg_10_foo_fact.line_class_id as c0, sum(agg_10_foo_fact.unit_sales) as m0 from agg_10_foo_fact as agg_10_foo_fact group by agg_10_foo_fact.line_class_id;
