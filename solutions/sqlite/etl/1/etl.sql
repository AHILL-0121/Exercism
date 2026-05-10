-- Schema: CREATE TABLE "etl" ("input" TEXT, "result" TEXT);
-- Task: update the etl table and set the result based on the input field. The keys in the result object must be sorted alphabetically.
UPDATE etl
SET result = (
  SELECT '{' || group_concat('"' || ltr || '":' || score, ',') || '}'
  FROM (
    SELECT lower(letter.value) AS ltr, CAST(score.key AS INTEGER) AS score
    FROM json_each(etl.input) AS score,
         json_each(score.value) AS letter
    ORDER BY lower(letter.value)
  )
);