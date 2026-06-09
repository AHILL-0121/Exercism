def recite(start, take=1):
    numbers = ["no", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]
    verses = []
    for i in range(take):
        current = start - i
        next_ = current - 1
        curr_word = numbers[current].capitalize()
        next_word = numbers[next_]
        curr_bottle = "bottle" if current == 1 else "bottles"
        next_bottle = "bottle" if next_ == 1 else "bottles"
        verse = [
            f"{curr_word} green {curr_bottle} hanging on the wall,",
            f"{curr_word} green {curr_bottle} hanging on the wall,",
            f"And if one green bottle should accidentally fall,",
            f"There'll be {next_word} green {next_bottle} hanging on the wall.",
        ]
        verses.append(verse)
    return [line for i, verse in enumerate(verses) for line in (verse + ([""]) if i < len(verses) - 1 else verse)]