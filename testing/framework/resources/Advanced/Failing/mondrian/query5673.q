select count(*) from (select distinct alt_promotion.promo_name as c0 from (SELECT * FROM (VALUES (0, 'Promo0'), (1, CAST(NULL AS VARCHAR(6)))) AS t (promo_id, promo_name)) as alt_promotion) as init;
