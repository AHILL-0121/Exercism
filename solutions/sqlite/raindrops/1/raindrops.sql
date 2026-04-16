-- Schema: CREATE TABLE "raindrops" ("number" INT, "sound" TEXT);
-- Task: update the raindrops table and set the sound based on the number.
UPDATE raindrops
SET sound = (
  CASE
    WHEN number % 3 = 0 AND number % 5 = 0 AND number % 7 = 0 THEN 'PlingPlangPlong'
    WHEN number % 3 = 0 AND number % 5 = 0 THEN 'PlingPlang'
    WHEN number % 3 = 0 AND number % 7 = 0 THEN 'PlingPlong'
    WHEN number % 5 = 0 AND number % 7 = 0 THEN 'PlangPlong'
    WHEN number % 3 = 0 THEN 'Pling'
    WHEN number % 5 = 0 THEN 'Plang'
    WHEN number % 7 = 0 THEN 'Plong'
    ELSE CAST(number AS TEXT)
  END
);