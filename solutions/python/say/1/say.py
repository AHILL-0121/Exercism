def say(number):
    if number < 0 or number > 999_999_999_999:
        raise ValueError("input out of range")

    if number == 0:
        return "zero"

    ones = ["", "one", "two", "three", "four", "five", "six", "seven",
            "eight", "nine", "ten", "eleven", "twelve", "thirteen",
            "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    tens = ["", "", "twenty", "thirty", "forty", "fifty",
            "sixty", "seventy", "eighty", "ninety"]

    def say_below_1000(n):
        if n == 0:
            return ""
        elif n < 20:
            return ones[n]
        elif n < 100:
            remainder = n % 10
            return tens[n // 10] + ("-" + ones[remainder] if remainder else "")
        else:
            remainder = n % 100
            return ones[n // 100] + " hundred" + (" " + say_below_1000(remainder) if remainder else "")

    chunks = [
        (1_000_000_000, "billion"),
        (1_000_000,     "million"),
        (1_000,         "thousand"),
        (1,             ""),
    ]

    parts = []
    for value, label in chunks:
        if number >= value:
            chunk = number // value
            number %= value
            word = say_below_1000(chunk)
            parts.append(word + (" " + label if label else ""))

    return " ".join(parts)