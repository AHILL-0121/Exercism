-- Schema:
-- CREATE TABLE "square-root" (
--     radicand INTEGER NOT NULL,
--     result   INTEGER
-- );
--
-- Task: update the square-root table and set the result based on the radicand.
WITH RECURSIVE search(radicand, candidate) AS (
    SELECT radicand, 1 FROM "square-root"
    UNION ALL
    SELECT radicand, candidate + 1
    FROM search
    WHERE candidate * candidate < radicand
)
UPDATE "square-root"
SET result = (
    SELECT candidate
    FROM search
    WHERE search.radicand = "square-root".radicand
    AND candidate * candidate = radicand
);