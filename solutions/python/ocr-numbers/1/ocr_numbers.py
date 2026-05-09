DIGITS = {
    (" _ ", "| |", "|_|", "   "): "0",
    ("   ", "  |", "  |", "   "): "1",
    (" _ ", " _|", "|_ ", "   "): "2",
    (" _ ", " _|", " _|", "   "): "3",
    ("   ", "|_|", "  |", "   "): "4",
    (" _ ", "|_ ", " _|", "   "): "5",
    (" _ ", "|_ ", "|_|", "   "): "6",
    (" _ ", "  |", "  |", "   "): "7",
    (" _ ", "|_|", "|_|", "   "): "8",
    (" _ ", "|_|", " _|", "   "): "9",
}

def convert(input_grid):
    if len(input_grid) % 4 != 0:
        raise ValueError("Number of input lines is not a multiple of four")
    
    results = []
    for band_start in range(0, len(input_grid), 4):
        rows = input_grid[band_start:band_start + 4]
        width = max(len(r) for r in rows)
        if width % 3 != 0:
            raise ValueError("Number of input columns is not a multiple of three")
        rows = [r.ljust(width) for r in rows]
        band_result = ""
        for col in range(0, width, 3):
            cell = tuple(r[col:col + 3] for r in rows)
            band_result += DIGITS.get(cell, "?")
        results.append(band_result)
    
    return ",".join(results)