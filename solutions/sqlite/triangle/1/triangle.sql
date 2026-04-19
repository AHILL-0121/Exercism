-- Schema:
-- CREATE TABLE triangle (
--     property TEXT    NOT NULL,
--     side_a   REAL    NOT NULL,
--     side_b   REAL    NOT NULL,
--     side_c   REAL    NOT NULL,
--     result   BOOLEAN
-- );
--
-- Task: update the triangle and set result based on the property, side_a, side_b and side_c columns.
UPDATE triangle
SET result = CASE
    WHEN side_a <= 0 OR side_b <= 0 OR side_c <= 0 THEN FALSE
    WHEN side_a + side_b < side_c
      OR side_b + side_c < side_a
      OR side_a + side_c < side_b THEN FALSE
    WHEN property = 'equilateral' THEN (side_a = side_b AND side_b = side_c)
    WHEN property = 'isosceles'   THEN (side_a = side_b OR side_b = side_c OR side_a = side_c)
    WHEN property = 'scalene'     THEN (side_a != side_b AND side_b != side_c AND side_a != side_c)
    ELSE FALSE
END;