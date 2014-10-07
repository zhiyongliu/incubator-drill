select t.trans_id transaction, t.user_info.cust_id customer from `clicks/clicks.campaign.json` t 
union all 
select u.trans_id, u.user_info.cust_id  from `clicks/clicks.json` u limit 5;
