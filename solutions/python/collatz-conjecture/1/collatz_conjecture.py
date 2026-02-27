from itertools import count 

def steps(number):
    if number <= 0:
        raise ValueError("Only positive integers are allowed")
    for step in count(0):
        if number == 1:
            return step
        number = number / 2 if number % 2 == 0 else 3 * number + 1