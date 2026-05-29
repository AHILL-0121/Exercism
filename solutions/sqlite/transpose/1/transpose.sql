WITH RECURSIVE
rows AS (
  SELECT
    t.rowid AS tid,
    value AS line,
    ROW_NUMBER() OVER (PARTITION BY t.rowid ORDER BY (SELECT 1)) - 1 AS rn
  FROM transpose t, json_each(
    '["' || REPLACE(REPLACE(t.lines, '\', '\\'), char(10), '","') || '"]'
  )
),
meta AS (
  SELECT tid, MAX(LENGTH(line)) AS max_len, MAX(rn) AS max_rn
  FROM rows GROUP BY tid
),
col_idx(n) AS (SELECT 0 UNION ALL SELECT n+1 FROM col_idx WHERE n < 999),
cols AS (
  SELECT m.tid, c.n AS col
  FROM meta m JOIN col_idx c ON c.n < m.max_len
),
last_row_with_char AS (
  SELECT r.tid, c.col, MAX(r.rn) AS last_rn
  FROM cols c
  JOIN rows r ON r.tid = c.tid AND LENGTH(r.line) > c.col
  GROUP BY r.tid, c.col
),
chars AS (
  SELECT
    r.tid, c.col, r.rn,
    CASE
      WHEN LENGTH(r.line) > c.col THEN SUBSTR(r.line, c.col + 1, 1)
      WHEN r.rn < l.last_rn      THEN ' '
      ELSE NULL
    END AS ch
  FROM cols c
  JOIN rows r ON r.tid = c.tid
  JOIN meta m ON m.tid = c.tid AND r.rn <= m.max_rn
  JOIN last_row_with_char l ON l.tid = c.tid AND l.col = c.col
),
transposed_rows AS (
  SELECT tid, col, GROUP_CONCAT(COALESCE(ch, ''), '') AS t_row
  FROM (SELECT * FROM chars ORDER BY tid, col, rn)
  GROUP BY tid, col
),
final AS (
  SELECT tid, GROUP_CONCAT(t_row, char(10)) AS result
  FROM (SELECT * FROM transposed_rows ORDER BY tid, col)
  GROUP BY tid
)
UPDATE transpose
SET result = COALESCE((SELECT result FROM final WHERE final.tid = transpose.rowid), '');