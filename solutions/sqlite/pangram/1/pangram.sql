-- Schema: CREATE TABLE pangram (sentence TEXT NOT NULL, result BOOLEAN);
-- Task: update pangram table and set result based on sentence.
UPDATE pangram
SET result = (
    LOWER(sentence) LIKE '%a%' AND LOWER(sentence) LIKE '%b%' AND
    LOWER(sentence) LIKE '%c%' AND LOWER(sentence) LIKE '%d%' AND
    LOWER(sentence) LIKE '%e%' AND LOWER(sentence) LIKE '%f%' AND
    LOWER(sentence) LIKE '%g%' AND LOWER(sentence) LIKE '%h%' AND
    LOWER(sentence) LIKE '%i%' AND LOWER(sentence) LIKE '%j%' AND
    LOWER(sentence) LIKE '%k%' AND LOWER(sentence) LIKE '%l%' AND
    LOWER(sentence) LIKE '%m%' AND LOWER(sentence) LIKE '%n%' AND
    LOWER(sentence) LIKE '%o%' AND LOWER(sentence) LIKE '%p%' AND
    LOWER(sentence) LIKE '%q%' AND LOWER(sentence) LIKE '%r%' AND
    LOWER(sentence) LIKE '%s%' AND LOWER(sentence) LIKE '%t%' AND
    LOWER(sentence) LIKE '%u%' AND LOWER(sentence) LIKE '%v%' AND
    LOWER(sentence) LIKE '%w%' AND LOWER(sentence) LIKE '%x%' AND
    LOWER(sentence) LIKE '%y%' AND LOWER(sentence) LIKE '%z%'
);