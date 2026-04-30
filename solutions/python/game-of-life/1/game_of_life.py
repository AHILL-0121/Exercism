def tick(matrix):
    if not matrix or not matrix[0]:
        return matrix

    rows = len(matrix)
    cols = len(matrix[0])
    next_gen = []

    for r in range(rows):
        row = []
        for c in range(cols):
            live_neighbors = sum(
                matrix[nr][nc]
                for nr in range(r - 1, r + 2)
                for nc in range(c - 1, c + 2)
                if (nr, nc) != (r, c)
                and 0 <= nr < rows
                and 0 <= nc < cols
            )
            cell = matrix[r][c]
            if cell == 1 and live_neighbors in (2, 3):
                row.append(1)
            elif cell == 0 and live_neighbors == 3:
                row.append(1)
            else:
                row.append(0)
        next_gen.append(row)

    return next_gen