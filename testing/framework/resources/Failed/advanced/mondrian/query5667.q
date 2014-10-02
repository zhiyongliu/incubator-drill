select count(*) from (select distinct alt_promotion.promo_id as c0 from (SELECT * FROM (VALUES (0, 'Promo0'), (1, 'Promo1')) AS t (promo_id, promo_name)) as alt_promotion) as init;
