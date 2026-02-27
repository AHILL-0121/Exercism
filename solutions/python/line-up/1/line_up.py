def line_up(name, number):
    last_two = number % 100
    last_one = number % 10

    if last_two in (11, 12, 13):
        suffix = "th"
    elif last_one == 1:
        suffix = "st"
    elif last_one == 2:
        suffix = "nd"
    elif last_one == 3:
        suffix = "rd"
    else:
        suffix = "th"

    return f"{name}, you are the {number}{suffix} customer we serve today. Thank you!"
