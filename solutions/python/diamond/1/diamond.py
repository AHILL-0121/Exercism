def rows(letter):
    n = ord(letter) - ord('A')
    width = 2 * n + 1
    result = []
    for i in range(n + 1):
        ch = chr(ord('A') + i)
        if i == 0:
            row = ' ' * (n - i) + ch + ' ' * (n - i)
        else:
            row = ' ' * (n - i) + ch + ' ' * (2 * i - 1) + ch + ' ' * (n - i)
        result.append(row)
    return result + result[-2::-1]