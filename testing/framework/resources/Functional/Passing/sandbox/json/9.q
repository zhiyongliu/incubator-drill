select * from (select t.trans_id, t.trans_info.prod_id[0] as prodid,
t.trans_info.purch_flag as purchased
from `clicks/clicks.json` t) sq
where sq.prodid between 700 and 750 and sq.purchased='true' order by sq.prodid;
