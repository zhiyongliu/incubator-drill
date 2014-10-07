select `month`, sum(order_total)
from orders group by `month` order by 2 desc;
