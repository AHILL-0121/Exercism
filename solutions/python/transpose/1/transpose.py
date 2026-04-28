def transpose(text):
    if not text:
        return ""

    rows = text.split("\n")
    max_len = max(len(row) for row in rows)

    result = []
    for c in range(max_len):
        col = []
        for r, row in enumerate(rows):
            if c < len(row):
                col.append(row[c])
            else:
                # Only pad if a later row has a character at this column
                if any(c < len(rows[r2]) for r2 in range(r + 1, len(rows))):
                    col.append(" ")
        result.append("".join(col))

    return "\n".join(result)