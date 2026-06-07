UPDATE color_code
SET result = (
    WITH color_map(color, val) AS (
        VALUES
            ('black', 0), ('brown', 1), ('red', 2), ('orange', 3),
            ('yellow', 4), ('green', 5), ('blue', 6), ('violet', 7),
            ('grey', 8), ('white', 9)
    ),
    computed AS (
        SELECT
            (c1.val * 10 + c2.val) * CAST(POWER(10, c3.val) AS INTEGER) AS ohms
        FROM
            color_map c1,
            color_map c2,
            color_map c3
        WHERE
            c1.color = color_code.color1
            AND c2.color = color_code.color2
            AND c3.color = color_code.color3
    )
    SELECT
        CASE
            WHEN ohms >= 1000000000 THEN
                CASE WHEN ohms % 1000000000 = 0
                    THEN CAST(ohms / 1000000000 AS INTEGER) || ' gigaohms'
                    ELSE CAST(CAST(ohms / 1000000000.0 AS REAL) AS TEXT) || ' gigaohms'
                END
            WHEN ohms >= 1000000 THEN
                CASE WHEN ohms % 1000000 = 0
                    THEN CAST(ohms / 1000000 AS INTEGER) || ' megaohms'
                    ELSE CAST(CAST(ohms / 1000000.0 AS REAL) AS TEXT) || ' megaohms'
                END
            WHEN ohms >= 1000 THEN
                CASE WHEN ohms % 1000 = 0
                    THEN CAST(ohms / 1000 AS INTEGER) || ' kiloohms'
                    ELSE CAST(CAST(ohms / 1000.0 AS REAL) AS TEXT) || ' kiloohms'
                END
            ELSE
                CAST(ohms AS INTEGER) || ' ohms'
        END
    FROM computed
);