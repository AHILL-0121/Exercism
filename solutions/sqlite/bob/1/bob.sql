-- Schema: CREATE TABLE "bob" ("input" TEXT, "reply" TEXT);
-- Task: update the bob table and set the reply based on the input.
UPDATE bob
SET reply = 
  CASE
    WHEN REPLACE(REPLACE(REPLACE(REPLACE(input, ' ', ''), CHAR(9), ''), CHAR(10), ''), CHAR(13), '') = ''
      THEN 'Fine. Be that way!'

    WHEN UPPER(TRIM(input)) = TRIM(input)
     AND TRIM(input) GLOB '*[A-Z]*'
     AND TRIM(input) LIKE '%?'
      THEN 'Calm down, I know what I''m doing!'

    WHEN UPPER(TRIM(input)) = TRIM(input)
     AND TRIM(input) GLOB '*[A-Z]*'
      THEN 'Whoa, chill out!'

    WHEN TRIM(input) LIKE '%?'
      THEN 'Sure.'

    ELSE 'Whatever.'
  END;