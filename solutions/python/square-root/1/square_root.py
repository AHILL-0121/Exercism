def square_root(number):
    if number == 1:
        return 1
    low, high = 1, number // 2
    while low <= high:
        mid = (low + high) // 2
        sq = mid * mid
        if sq == number:
            return mid
        elif sq < number:
            low = mid + 1
        else:
            high = mid - 1