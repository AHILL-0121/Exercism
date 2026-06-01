-- Schema: CREATE TABLE "reverse-string" (input TEXT NOT NULL, result TEXT);
-- Task: update the reverse-string table and set the result based on the input.
WITH RECURSIVE rev AS (
  SELECT input, LENGTH(input) AS pos, '' AS acc
  FROM "reverse-string"
  UNION ALL
  SELECT input, pos - 1, acc || SUBSTR(input, pos, 1)
  FROM rev WHERE pos > 0
)
UPDATE "reverse-string" SET result = (
  SELECT acc FROM rev
  WHERE rev.input = "reverse-string".input
  AND pos = 0
);