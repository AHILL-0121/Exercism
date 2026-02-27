def is_armstrong_number(number):
    return sum(int(d)**len(str(number)) for d in str(number)) == number