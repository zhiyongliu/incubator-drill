select count(*) from (select distinct alt_promotion.promo_id as c0 from (SELECT * FROM (VALUES (0, 'First promo'), (1, 'Second promo')) AS t (promo_id, promo_name)) as alt_promotion) as init;
