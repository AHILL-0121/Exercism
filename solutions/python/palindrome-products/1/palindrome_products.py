def largest(min_factor, max_factor):
    if min_factor > max_factor:
        raise ValueError("min must be <= max")
    result, factors = None, []
    for i in range(max_factor, min_factor - 1, -1):
        if result is not None and i * max_factor < result:
            break
        for j in range(max_factor, i - 1, -1):
            p = i * j
            if result is not None and p < result:
                break
            s = str(p)
            if s == s[::-1]:
                if result is None or p > result:
                    result, factors = p, [[i, j]]
                elif p == result:
                    factors.append([i, j])
    return (result, factors)


def smallest(min_factor, max_factor):
    if min_factor > max_factor:
        raise ValueError("min must be <= max")
    result, factors = None, []
    for i in range(min_factor, max_factor + 1):
        if result is not None and i * i > result:
            break
        for j in range(i, max_factor + 1):
            p = i * j
            if result is not None and p > result:
                break
            s = str(p)
            if s == s[::-1]:
                if result is None or p < result:
                    result, factors = p, [[i, j]]
                elif p == result:
                    factors.append([i, j])
    return (result, factors)