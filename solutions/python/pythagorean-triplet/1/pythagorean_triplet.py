def triplets_with_sum(number):
    triplets = []
    for a in range(1, number // 3 + 1):
        b, rem = divmod(number * (number - 2 * a), 2 * (number - a))
        if rem == 0 and a < b:
            c = number - a - b
            if b < c and a * a + b * b == c * c:
                triplets.append([a, b, c])
    return triplets