WITH RECURSIVE
  bs AS (
    -- Base case: initial state
    SELECT
      array,
      value,
      0 AS low,
      json_array_length(array) - 1 AS high
    FROM "binary-search"

    UNION ALL

    -- Recursive step
    SELECT
      bs.array,
      bs.value,
      CASE WHEN json_extract(bs.array, '$[' || ((bs.low + bs.high) / 2) || ']') < bs.value
           THEN (bs.low + bs.high) / 2 + 1
           ELSE bs.low
      END,
      CASE WHEN json_extract(bs.array, '$[' || ((bs.low + bs.high) / 2) || ']') > bs.value
           THEN (bs.low + bs.high) / 2 - 1
           ELSE bs.high
      END
    FROM bs
    WHERE bs.low <= bs.high
      AND json_extract(bs.array, '$[' || ((bs.low + bs.high) / 2) || ']') != bs.value
  )
UPDATE "binary-search"
SET
  result = (
    SELECT (low + high) / 2
    FROM bs
    WHERE bs.array = "binary-search".array
      AND bs.value = "binary-search".value
      AND json_extract(bs.array, '$[' || ((low + high) / 2) || ']') = bs.value
    LIMIT 1
  ),
  error = CASE
    WHEN (
      SELECT COUNT(*)
      FROM bs
      WHERE bs.array = "binary-search".array
        AND bs.value = "binary-search".value
        AND json_extract(bs.array, '$[' || ((low + high) / 2) || ']') = bs.value
    ) = 0
    THEN 'value not in array'
    ELSE NULL
  END;