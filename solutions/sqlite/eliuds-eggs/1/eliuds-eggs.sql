-- Schema: CREATE TABLE "eliuds-eggs" ("number" INT, "result" INT);
-- Task: update the eliuds-eggs table and set the result based on the number field.
UPDATE "eliuds-eggs"
SET result = (
  WITH RECURSIVE bits(n, count) AS (
    SELECT number, 0
    UNION ALL
    SELECT n / 2, count + (n % 2)
    FROM bits WHERE n > 0
  )
  SELECT count FROM bits WHERE n = 0
);