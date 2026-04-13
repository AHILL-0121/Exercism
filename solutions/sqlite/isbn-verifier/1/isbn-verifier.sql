-- Schema: CREATE TABLE "isbn-verifier" (isbn TEXT NOT NULL, result BOOL);
-- Task: update the isbn-verifier table and set the result based on the isbn.
UPDATE "isbn-verifier"
SET result = (
  WITH
  c AS (
    SELECT REPLACE(isbn, '-', '') AS s
  ),
  v AS (
    SELECT
      s,
      SUBSTR(s, 1, 1)  AS d1,
      SUBSTR(s, 2, 1)  AS d2,
      SUBSTR(s, 3, 1)  AS d3,
      SUBSTR(s, 4, 1)  AS d4,
      SUBSTR(s, 5, 1)  AS d5,
      SUBSTR(s, 6, 1)  AS d6,
      SUBSTR(s, 7, 1)  AS d7,
      SUBSTR(s, 8, 1)  AS d8,
      SUBSTR(s, 9, 1)  AS d9,
      SUBSTR(s, 10, 1) AS d10
    FROM c
  )
  SELECT
    CASE
      WHEN LENGTH(s) <> 10 THEN 0
      WHEN s NOT GLOB '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9X]' THEN 0
      ELSE (
        CAST(d1  AS INT) * 10 +
        CAST(d2  AS INT) *  9 +
        CAST(d3  AS INT) *  8 +
        CAST(d4  AS INT) *  7 +
        CAST(d5  AS INT) *  6 +
        CAST(d6  AS INT) *  5 +
        CAST(d7  AS INT) *  4 +
        CAST(d8  AS INT) *  3 +
        CAST(d9  AS INT) *  2 +
        CASE d10 WHEN 'X' THEN 10 ELSE CAST(d10 AS INT) END
      ) % 11 = 0
    END
  FROM v
);