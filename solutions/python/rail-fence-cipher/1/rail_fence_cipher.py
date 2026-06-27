def encode(message, rails):
    fence = [[] for _ in range(rails)]
    rail, direction = 0, 1
    for char in message:
        fence[rail].append(char)
        if rail == 0:
            direction = 1
        elif rail == rails - 1:
            direction = -1
        rail += direction
    return "".join("".join(r) for r in fence)


def decode(encoded_message, rails):
    n = len(encoded_message)
    indices = list(range(n))
    pattern = []
    rail, direction = 0, 1
    for i in indices:
        pattern.append(rail)
        if rail == 0:
            direction = 1
        elif rail == rails - 1:
            direction = -1
        rail += direction
    order = sorted(range(n), key=lambda i: pattern[i])
    result = [""] * n
    for pos, char in zip(order, encoded_message):
        result[pos] = char
    return "".join(result)