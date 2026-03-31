import re

def count_words(sentence):
    words = re.findall(r"[a-z0-9]+(?:'[a-z]+)*", sentence.lower())
    counts = {}
    for word in words:
        counts[word] = counts.get(word, 0) + 1
    return counts