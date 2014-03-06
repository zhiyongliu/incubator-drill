SELECT
  _MAP['N_REGIONKEY'] as regionKey,
  _MAP['N_NAME'] as name
FROM
  "/nation.parquet"
WHERE
  cast(_MAP['N_NAME'] as varchar) IN ('MOROCCO', 'MOZAMBIQUE');
