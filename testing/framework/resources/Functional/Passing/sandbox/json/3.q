select t.user_info.device, count(*) from `clicks/clicks.json` t 
group by t.user_info.device
having count(*) > 1000;
