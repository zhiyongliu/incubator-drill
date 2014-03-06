select nations.name, regions.name from (
  select _MAP['N_REGIONKEY'] as regionKey, _MAP['N_NAME'] as name
  from "/nation.parquet") nations
join (
  select _MAP['R_REGIONKEY'] as regionKey, _MAP['R_NAME'] as name
  from "/region.parquet") regions
on nations.regionKey = regions.regionKey
order by nations.name;
