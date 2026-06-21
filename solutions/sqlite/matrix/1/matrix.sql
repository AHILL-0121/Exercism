WITH RECURSIVE
src AS (
    SELECT rowid AS rid, string, property, "index" AS idx
    FROM matrix
),
split_rows(rid, string, property, idx, row_num, rest) AS (
    SELECT rid, string, property, idx, 1, string || char(10)
    FROM src
    UNION ALL
    SELECT rid, string, property, idx, row_num + 1,
           substr(rest, instr(rest, char(10)) + 1)
    FROM split_rows
    WHERE instr(rest, char(10)) > 0
),
rows_indexed(rid, row_num, row_text) AS (
    SELECT rid, row_num,
           substr(rest, 1, instr(rest, char(10)) - 1)
    FROM split_rows
    WHERE instr(rest, char(10)) > 0
      AND length(substr(rest, 1, instr(rest, char(10)) - 1)) > 0
),
split_cols(rid, row_num, row_text, col_num, rest2) AS (
    SELECT rid, row_num, row_text, 1, row_text || ' '
    FROM rows_indexed
    UNION ALL
    SELECT rid, row_num, row_text, col_num + 1,
           substr(rest2, instr(rest2, ' ') + 1)
    FROM split_cols
    WHERE instr(rest2, ' ') > 0
),
cells(rid, row_num, col_num, val) AS (
    SELECT rid, row_num, col_num,
           CAST(substr(rest2, 1, instr(rest2, ' ') - 1) AS INTEGER)
    FROM split_cols
    WHERE instr(rest2, ' ') > 0
)
UPDATE matrix
SET result = (
    SELECT json_group_array(val)
    FROM (
        SELECT c.val
        FROM cells c
        JOIN src s ON s.rid = c.rid
        WHERE s.rid = matrix.rowid
          AND (
            (s.property = 'row'    AND c.row_num = s.idx)
            OR
            (s.property = 'column' AND c.col_num = s.idx)
          )
        ORDER BY CASE s.property
                   WHEN 'row'    THEN c.col_num
                   WHEN 'column' THEN c.row_num
                 END
    )
);