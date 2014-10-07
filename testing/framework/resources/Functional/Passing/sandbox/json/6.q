select t.trans_info.prod_id as prodid, t.trans_info.purch_flag as
purchased
from `clicks/clicks.json` t limit 5;
