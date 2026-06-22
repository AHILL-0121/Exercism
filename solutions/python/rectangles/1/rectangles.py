def rectangles(strings):
    if not strings:
        return 0
    
    count = 0
    rows = len(strings)
    cols = len(strings[0])

    def valid_horizontal(row, c1, c2):
        return all(ch in '-+' for ch in strings[row][c1:c2+1])

    def valid_vertical(col, r1, r2):
        return all(strings[r][col] in '|+' for r in range(r1, r2+1))

    for r1 in range(rows):
        for r2 in range(r1+1, rows):
            for c1 in range(cols):
                for c2 in range(c1+1, cols):
                    if (strings[r1][c1] == '+' and
                        strings[r1][c2] == '+' and
                        strings[r2][c1] == '+' and
                        strings[r2][c2] == '+' and
                        valid_horizontal(r1, c1, c2) and
                        valid_horizontal(r2, c1, c2) and
                        valid_vertical(c1, r1, r2) and
                        valid_vertical(c2, r1, r2)):
                        count += 1

    return count