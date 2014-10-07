select sum(cast(columns[10] as int)) as total, avg(cast(columns[10] as int)) as average from store_sales where columns[10] is null;
