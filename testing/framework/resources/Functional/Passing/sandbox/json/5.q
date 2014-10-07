select t.user_info.cust_id as custid, t.user_info.device as device,
t.user_info.state as state
from `clicks/clicks.json` t limit 5;
