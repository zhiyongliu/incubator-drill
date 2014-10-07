select sn.desc as c0 from (SELECT * FROM (VALUES (1, 'SameName')) AS t (id, desc)) as sn group by sn.desc order by sn.desc ASC NULLS LAST;
