select t.trans_id, t.`date` as session_date, t.user_info.cust_id as
cust_id, t.user_info.device as device, repeated_count(t.trans_info.prod_id) as
prod_count, t.trans_info.purch_flag as purch_flag
from `clicks/clicks.json` t
where t.trans_info.purch_flag = 'true' order by prod_count desc;
