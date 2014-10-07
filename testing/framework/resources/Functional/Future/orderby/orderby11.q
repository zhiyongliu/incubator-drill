select c_row, c_groupby, cast(c_timestamptz as timestamptz) from data order by c_groupby asc, cast(c_timestamptz as timestamptz) desc;
