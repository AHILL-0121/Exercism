-- Schema:
-- CREATE TABLE "grade-school" (
--   property TEXT NOT NULL,
--   input    TEXT NOT NULL,    -- json object
--   result   TEXT              -- json array
-- );
--
-- Task: update the grade-school and update the result column based on the property and the input.
WITH
add_students AS (
  SELECT
    gs.rowid,
    CAST(idx.key AS INTEGER)                         AS pos,
    json_extract(idx.value, '$[0]')                  AS student,
    CAST(json_extract(idx.value, '$[1]') AS INTEGER) AS grade
  FROM "grade-school" gs, json_each(json_extract(gs.input, '$.students')) idx
  WHERE gs.property = 'add'
),
flagged AS (
  SELECT
    a.rowid, a.pos, a.student, a.grade,
    EXISTS (
      SELECT 1 FROM add_students a2
      WHERE a2.rowid   = a.rowid
        AND a2.student = a.student
        AND a2.pos     < a.pos
    ) AS is_dup
  FROM add_students a
)
UPDATE "grade-school"
SET result = CASE property

  WHEN 'add' THEN (
    SELECT json_group_array(
      CASE WHEN is_dup THEN json('false') ELSE json('true') END
    )
    FROM (
      SELECT is_dup FROM flagged
      WHERE rowid = "grade-school".rowid
      ORDER BY pos
    )
  )

  WHEN 'grade' THEN (
    SELECT json_group_array(student)
    FROM (
      SELECT student FROM (
        SELECT
          json_extract(s.value, '$[0]')                    AS student,
          CAST(json_extract(s.value, '$[1]') AS INTEGER)   AS grade,
          ROW_NUMBER() OVER (
            PARTITION BY json_extract(s.value, '$[0]')
            ORDER BY CAST(s.key AS INTEGER)
          ) AS rn
        FROM json_each(json_extract("grade-school".input, '$.students')) s
      )
      WHERE rn = 1
        AND grade = CAST(json_extract("grade-school".input, '$.desiredGrade') AS INTEGER)
      ORDER BY student
    )
  )

  WHEN 'roster' THEN (
    SELECT json_group_array(student)
    FROM (
      SELECT student, grade FROM (
        SELECT
          json_extract(s.value, '$[0]')                    AS student,
          CAST(json_extract(s.value, '$[1]') AS INTEGER)   AS grade,
          ROW_NUMBER() OVER (
            PARTITION BY json_extract(s.value, '$[0]')
            ORDER BY CAST(s.key AS INTEGER)
          ) AS rn
        FROM json_each(json_extract("grade-school".input, '$.students')) s
      )
      WHERE rn = 1
      ORDER BY grade, student
    )
  )

END;