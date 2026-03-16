def translate(text):
    vowels = ("a", "e", "i", "o", "u")
    result = []

    for word in text.split():
        if word.startswith(vowels) or word.startswith(("xr", "yt")):
            result.append(word + "ay")
            continue

        if "qu" in word:
            idx = word.find("qu")
            if idx == 0 or all(c not in vowels for c in word[:idx]):
                result.append(word[idx+2:] + word[:idx+2] + "ay")
                continue

        for i, c in enumerate(word):
            if c in vowels or (c == "y" and i != 0):
                result.append(word[i:] + word[:i] + "ay")
                break

    return " ".join(result)