SUBLIST = 0
SUPERLIST = 1
EQUAL = 2
UNEQUAL = 3

def sublist(list_one, list_two):
    def contains(a, b):
        if not b:
            return True
        lb = len(b)
        return any(a[i:i+lb] == b for i in range(len(a) - lb + 1))

    if list_one == list_two:
        return EQUAL
    elif contains(list_one, list_two):
        return SUPERLIST
    elif contains(list_two, list_one):
        return SUBLIST
    return UNEQUAL
    