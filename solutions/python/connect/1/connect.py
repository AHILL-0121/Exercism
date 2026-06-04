class ConnectGame:
    def __init__(self, board):
        self.board = [row.split() for row in board.strip().split("\n")]
        self.rows = len(self.board)
        self.cols = len(self.board[0])

    def get_winner(self):
        if self._check_winner("O"):
            return "O"
        if self._check_winner("X"):
            return "X"
        return ""

    def _check_winner(self, player):
        visited = set()

        if player == "O":
            starts = [(0, c) for c in range(self.cols) if self.board[0][c] == "O"]
        else:
            starts = [(r, 0) for r in range(self.rows) if self.board[r][0] == "X"]

        stack = [s for s in starts]
        visited = set(starts)

        while stack:
            r, c = stack.pop()
            if player == "O" and r == self.rows - 1:
                return True
            if player == "X" and c == self.cols - 1:
                return True
            for nr, nc in self._neighbors(r, c):
                if (nr, nc) not in visited and self.board[nr][nc] == player:
                    visited.add((nr, nc))
                    stack.append((nr, nc))

        return False

    def _neighbors(self, r, c):
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1), (-1, 1), (1, -1)]
        return [
            (r + dr, c + dc)
            for dr, dc in directions
            if 0 <= r + dr < self.rows and 0 <= c + dc < self.cols
        ]