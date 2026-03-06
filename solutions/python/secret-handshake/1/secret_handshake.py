def commands(binary_str):
    actions = ["wink", "double blink", "close your eyes", "jump"]
    result = [actions[i] for i, bit in enumerate(reversed(binary_str[-5:])) if bit == '1' and i < 4]
    if len(binary_str) >= 5 and binary_str[-5] == '1':
        result.reverse()
    return result