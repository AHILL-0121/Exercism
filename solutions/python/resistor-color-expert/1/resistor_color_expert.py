def resistor_label(colors):
    color_values = {
        "black": 0, "brown": 1, "red": 2, "orange": 3, "yellow": 4,
        "green": 5, "blue": 6, "violet": 7, "grey": 8, "white": 9
    }
    tolerance_values = {
        "grey": "±0.05%", "violet": "±0.1%", "blue": "±0.25%", "green": "±0.5%",
        "brown": "±1%", "red": "±2%", "gold": "±5%", "silver": "±10%"
    }

    if len(colors) == 1:
        return "0 ohms"

    tolerance = tolerance_values[colors[-1]]
    multiplier = 10 ** color_values[colors[-2]]

    if len(colors) == 4:
        main_value = (color_values[colors[0]] * 10 + color_values[colors[1]]) * multiplier
    else:  # 5 bands
        main_value = (color_values[colors[0]] * 100 + color_values[colors[1]] * 10 + color_values[colors[2]]) * multiplier

    if main_value >= 1_000_000:
        value = main_value / 1_000_000
        unit = "megaohms"
    elif main_value >= 1_000:
        value = main_value / 1_000
        unit = "kiloohms"
    else:
        value = main_value
        unit = "ohms"

    formatted = int(value) if value == int(value) else value
    return f"{formatted} {unit} {tolerance}"