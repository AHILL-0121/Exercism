-- Schema:
-- CREATE TABLE "flatten-array" (
--   array  TEXT NOT NULL,    -- json array
--   result TEXT              -- json array
-- );
WITH RECURSIVE flat(rowid, val, type, path) AS (
  SELECT f.rowid, e.value, e.type, printf('%09d', e.key)
  FROM "flatten-array" f, json_each(f.array) e

  UNION ALL

  SELECT flat.rowid, e.value, e.type, flat.path || '.' || printf('%09d', e.key)
  FROM flat, json_each(flat.val) e
  WHERE flat.type = 'array'
)
UPDATE "flatten-array"
SET result = (
  SELECT json_group_array(val)
  FROM (
    SELECT val FROM flat
    WHERE flat.rowid = "flatten-array".rowid
      AND type NOT IN ('array', 'null')
    ORDER BY path
  )
);
