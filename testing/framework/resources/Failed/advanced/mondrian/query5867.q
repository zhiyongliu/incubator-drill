select t.big_num as c0 from (SELECT * FROM (VALUES (0, 1234, 'Ben'), (519, 1234567890123, 'Bill')) AS t (id, big_num, name)) as t group by t.big_num order by t.big_num ASC NULLS LAST;
