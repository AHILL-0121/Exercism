VERSES = [
    ("the house that Jack built", None),
    ("the malt", "lay in"),
    ("the rat", "ate"),
    ("the cat", "killed"),
    ("the dog", "worried"),
    ("the cow with the crumpled horn", "tossed"),
    ("the maiden all forlorn", "milked"),
    ("the man all tattered and torn", "kissed"),
    ("the priest all shaven and shorn", "married"),
    ("the rooster that crowed in the morn", "woke"),
    ("the farmer sowing his corn", "kept"),
    ("the horse and the hound and the horn", "belonged to"),
]


def recite(start_verse, end_verse):
    result = []
    for verse_num in range(start_verse, end_verse + 1):
        idx = verse_num - 1
        parts = [f"This is {VERSES[idx][0]}"]
        for i in range(idx, 0, -1):
            parts.append(f"that {VERSES[i][1]} {VERSES[i - 1][0]}")
        result.append(" ".join(parts) + ".")
    return result