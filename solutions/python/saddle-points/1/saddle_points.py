def saddle_points(matrix):
    if not matrix:
        return []
    row_len = len(matrix[0])
    if any(len(row) != row_len for row in matrix):
        raise ValueError("irregular matrix")
    return [
        {"row": r + 1, "column": c + 1}
        for r, row in enumerate(matrix)
        for c, val in enumerate(row)
        if val == max(row) and val == min(matrix[i][c] for i in range(len(matrix)))
    ]