-- Schema: CREATE TABLE "grains" ("task" TEXT, "square" INT, "result" INT);
-- Task: update the grains table and set the result based on the task (and square fields).
UPDATE grains
SET result = CASE
    WHEN task = 'single-square' THEN pow(2.0, square - 1)
    WHEN task = 'total'         THEN pow(2.0, 64) - 1
    ELSE result
END;