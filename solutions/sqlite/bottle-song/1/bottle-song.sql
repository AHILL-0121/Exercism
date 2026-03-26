-- Schema:
-- CREATE TABLE "bottle-song" (
--         start_bottles INTEGER NOT NULL,
--         take_down     INTEGER NOT NULL,
--         result        TEXT
-- );
-- Task: update bottle-song table and set the result based on the
-- start_bottles and take_down.
WITH RECURSIVE
nums(n, word, bottle) AS (
    VALUES
        (0,  'no',    'bottles'),
        (1,  'one',   'bottle'),
        (2,  'two',   'bottles'),
        (3,  'three', 'bottles'),
        (4,  'four',  'bottles'),
        (5,  'five',  'bottles'),
        (6,  'six',   'bottles'),
        (7,  'seven', 'bottles'),
        (8,  'eight', 'bottles'),
        (9,  'nine',  'bottles'),
        (10, 'ten',   'bottles')
),
series(start_bottles, take_down, i) AS (
    SELECT start_bottles, take_down, 0
    FROM "bottle-song"
    UNION ALL
    SELECT start_bottles, take_down, i + 1
    FROM series
    WHERE i + 1 < take_down
),
built(start_bottles, take_down, i, verse) AS (
    SELECT
        s.start_bottles,
        s.take_down,
        s.i,
        upper(substr(w1.word,1,1)) || substr(w1.word,2) ||
            ' green ' || w1.bottle || ' hanging on the wall,' || char(10) ||
        upper(substr(w1.word,1,1)) || substr(w1.word,2) ||
            ' green ' || w1.bottle || ' hanging on the wall,' || char(10) ||
        'And if one green bottle should accidentally fall,' || char(10) ||
        'There''ll be ' || w2.word || ' green ' || w2.bottle || ' hanging on the wall.'
    FROM series s
    JOIN nums w1 ON w1.n = s.start_bottles - s.i
    JOIN nums w2 ON w2.n = s.start_bottles - s.i - 1
)
UPDATE "bottle-song"
SET result = (
    SELECT group_concat(verse, char(10) || char(10))
    FROM (
        SELECT verse FROM built b
        WHERE b.start_bottles = "bottle-song".start_bottles
          AND b.take_down     = "bottle-song".take_down
        ORDER BY i
    )
);