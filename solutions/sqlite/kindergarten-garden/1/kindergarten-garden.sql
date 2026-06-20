WITH students AS (
  SELECT 'Alice' AS name, 0 AS idx UNION ALL
  SELECT 'Bob', 1 UNION ALL
  SELECT 'Charlie', 2 UNION ALL
  SELECT 'David', 3 UNION ALL
  SELECT 'Eve', 4 UNION ALL
  SELECT 'Fred', 5 UNION ALL
  SELECT 'Ginny', 6 UNION ALL
  SELECT 'Harriet', 7 UNION ALL
  SELECT 'Ileana', 8 UNION ALL
  SELECT 'Joseph', 9 UNION ALL
  SELECT 'Kincaid', 10 UNION ALL
  SELECT 'Larry', 11
),
codes AS (
  SELECT
    k.rowid AS rid,
    s.idx,
    SUBSTR(SUBSTR(k.diagram, 1, INSTR(k.diagram, CHAR(10)) - 1), s.idx * 2 + 1, 1) AS r1c1,
    SUBSTR(SUBSTR(k.diagram, 1, INSTR(k.diagram, CHAR(10)) - 1), s.idx * 2 + 2, 1) AS r1c2,
    SUBSTR(SUBSTR(k.diagram, INSTR(k.diagram, CHAR(10)) + 1), s.idx * 2 + 1, 1) AS r2c1,
    SUBSTR(SUBSTR(k.diagram, INSTR(k.diagram, CHAR(10)) + 1), s.idx * 2 + 2, 1) AS r2c2
  FROM "kindergarten-garden" k
  JOIN students s ON s.name = k.student
),
named AS (
  SELECT
    rid,
    CASE r1c1 WHEN 'G' THEN 'grass' WHEN 'C' THEN 'clover' WHEN 'R' THEN 'radishes' WHEN 'V' THEN 'violets' END ||
    ',' ||
    CASE r1c2 WHEN 'G' THEN 'grass' WHEN 'C' THEN 'clover' WHEN 'R' THEN 'radishes' WHEN 'V' THEN 'violets' END ||
    ',' ||
    CASE r2c1 WHEN 'G' THEN 'grass' WHEN 'C' THEN 'clover' WHEN 'R' THEN 'radishes' WHEN 'V' THEN 'violets' END ||
    ',' ||
    CASE r2c2 WHEN 'G' THEN 'grass' WHEN 'C' THEN 'clover' WHEN 'R' THEN 'radishes' WHEN 'V' THEN 'violets' END
    AS result
  FROM codes
)
UPDATE "kindergarten-garden"
SET result = (SELECT n.result FROM named n WHERE n.rid = "kindergarten-garden".rowid);