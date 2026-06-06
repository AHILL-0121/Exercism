WITH RECURSIVE generate_rows(input, row_num, row_data) AS (
  SELECT input, 1, '[1]'
  FROM "pascals-triangle"
  WHERE input > 0

  UNION ALL

  SELECT
    g.input,
    g.row_num + 1,
    (
      WITH RECURSIVE build_next(pos, acc) AS (
        SELECT 1,
               '[' || CAST(json_extract(g.row_data, '$[0]') AS INT)

        UNION ALL

        SELECT
          pos + 1,
          acc || ',' || (
            COALESCE(CAST(json_extract(g.row_data, '$[' || pos || ']') AS INT), 0) +
            COALESCE(CAST(json_extract(g.row_data, '$[' || (pos - 1) || ']') AS INT), 0)
          )
        FROM build_next
        WHERE pos <= (SELECT COUNT(*) FROM json_each(g.row_data))
      )
      SELECT acc || ']' FROM build_next ORDER BY pos DESC LIMIT 1
    )
  FROM generate_rows g
  WHERE g.row_num < g.input
),
formatted AS (
  SELECT
    input,
    row_num,
    (
      SELECT GROUP_CONCAT(value, ' ')
      FROM json_each(row_data)
    ) AS row_text
  FROM generate_rows
)

UPDATE "pascals-triangle"
SET result = (
  SELECT GROUP_CONCAT(row_text, char(10))
  FROM formatted
  WHERE formatted.input = "pascals-triangle".input
  ORDER BY row_num
)
WHERE input > 0;

UPDATE "pascals-triangle"
SET result = ''
WHERE input = 0;