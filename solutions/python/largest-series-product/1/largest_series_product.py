from math import prod

def largest_product(series, size):
    if size < 0:
        raise ValueError("span must not be negative")
    if size > len(series):
        raise ValueError("span must not exceed string length")
    if not all(c.isdigit() for c in series):
        raise ValueError("digits input must only contain digits")
    if size == 0:
        return 1
    return max(prod(int(c) for c in series[i:i+size]) for i in range(len(series) - size + 1))