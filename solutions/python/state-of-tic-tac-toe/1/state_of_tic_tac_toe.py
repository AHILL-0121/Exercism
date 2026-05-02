def gamestate(board):
    rows = board
    cols = [[board[r][c] for r in range(3)] for c in range(3)]
    diags = [
        [board[i][i] for i in range(3)],
        [board[i][2 - i] for i in range(3)]
    ]

    def wins(p):
        return any(all(c == p for c in line) for line in rows + cols + diags)

    x_count = sum(row.count('X') for row in board)
    o_count = sum(row.count('O') for row in board)

    if o_count > x_count:
        raise ValueError("Wrong turn order: O started")
    if x_count > o_count + 1:
        raise ValueError("Wrong turn order: X went twice")

    x_wins = wins('X')
    o_wins = wins('O')

    if x_wins and o_wins:
        raise ValueError("Impossible board: game should have ended after the game was won")
    if x_wins and x_count == o_count:
        raise ValueError("Impossible board: game should have ended after the game was won")
    if o_wins and x_count > o_count:
        raise ValueError("Impossible board: game should have ended after the game was won")

    if x_wins or o_wins:
        return "win"
    if x_count + o_count == 9:
        return "draw"
    return "ongoing"