-- Schema: CREATE TABLE "allergies" ("task" TEXT, "item" TEXT, "score" INT NOT NULL, "result" TEXT);
-- Task: update the bob allergies and set the result based on the task.
--       - The `allergicTo` task expects `true` or `false` based on the `score` and the `item` fields.
--       - For the `list` task you have to write corresponding items to the result field
UPDATE allergies
SET result = CASE
  WHEN task = 'allergicTo' THEN
    CASE item
      WHEN 'eggs'         THEN CASE WHEN (score & 1)   != 0 THEN 'true' ELSE 'false' END
      WHEN 'peanuts'      THEN CASE WHEN (score & 2)   != 0 THEN 'true' ELSE 'false' END
      WHEN 'shellfish'    THEN CASE WHEN (score & 4)   != 0 THEN 'true' ELSE 'false' END
      WHEN 'strawberries' THEN CASE WHEN (score & 8)   != 0 THEN 'true' ELSE 'false' END
      WHEN 'tomatoes'     THEN CASE WHEN (score & 16)  != 0 THEN 'true' ELSE 'false' END
      WHEN 'chocolate'    THEN CASE WHEN (score & 32)  != 0 THEN 'true' ELSE 'false' END
      WHEN 'pollen'       THEN CASE WHEN (score & 64)  != 0 THEN 'true' ELSE 'false' END
      WHEN 'cats'         THEN CASE WHEN (score & 128) != 0 THEN 'true' ELSE 'false' END
      ELSE 'false'
    END

  WHEN task = 'list' THEN
    TRIM(
      CASE WHEN (score & 1)   != 0 THEN 'eggs, '         ELSE '' END ||
      CASE WHEN (score & 2)   != 0 THEN 'peanuts, '      ELSE '' END ||
      CASE WHEN (score & 4)   != 0 THEN 'shellfish, '    ELSE '' END ||
      CASE WHEN (score & 8)   != 0 THEN 'strawberries, ' ELSE '' END ||
      CASE WHEN (score & 16)  != 0 THEN 'tomatoes, '     ELSE '' END ||
      CASE WHEN (score & 32)  != 0 THEN 'chocolate, '    ELSE '' END ||
      CASE WHEN (score & 64)  != 0 THEN 'pollen, '       ELSE '' END ||
      CASE WHEN (score & 128) != 0 THEN 'cats, '         ELSE '' END,
      ', '
    )

  ELSE result
END;