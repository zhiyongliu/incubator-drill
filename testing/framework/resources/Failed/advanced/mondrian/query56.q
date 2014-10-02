select count(*) from (select distinct sn.desc as c0 from (SELECT * FROM (VALUES (1, 'SameName')) AS t (id, desc)) as sn) as init;
