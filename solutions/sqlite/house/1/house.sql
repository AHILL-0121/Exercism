WITH subjects(n, subj, conn) AS (
  VALUES
    (1,  'the house that Jack built.',           'that lay in '),
    (2,  'the malt',                             'that ate '),
    (3,  'the rat',                              'that killed '),
    (4,  'the cat',                              'that worried '),
    (5,  'the dog',                              'that tossed '),
    (6,  'the cow with the crumpled horn',       'that milked '),
    (7,  'the maiden all forlorn',               'that kissed '),
    (8,  'the man all tattered and torn',        'that married '),
    (9,  'the priest all shaven and shorn',      'that woke '),
    (10, 'the rooster that crowed in the morn',  'that kept '),
    (11, 'the farmer sowing his corn',           'that belonged to '),
    (12, 'the horse and the hound and the horn', '')
),
verse_text(v, txt) AS (
  SELECT s_top.n,
    (SELECT GROUP_CONCAT(
       CASE WHEN s.n = s_top.n THEN 'This is ' || s.subj
            ELSE s.conn || s.subj END,
       ' '
     )
     FROM (SELECT n, subj, conn FROM subjects WHERE n <= s_top.n ORDER BY n DESC) s
    )
  FROM subjects s_top
)
UPDATE house SET result = (
  SELECT GROUP_CONCAT(txt, char(10))   -- single newline between verses
  FROM (SELECT txt FROM verse_text WHERE v BETWEEN house.start_verse AND house.end_verse ORDER BY v)
);