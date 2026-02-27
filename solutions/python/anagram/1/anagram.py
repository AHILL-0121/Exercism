def find_anagrams(word, candidates):
    word_lower = word.lower()
    word_sorted = sorted(word_lower)
    return [c for c in candidates if c.lower() != word_lower and sorted(c.lower()) == word_sorted]