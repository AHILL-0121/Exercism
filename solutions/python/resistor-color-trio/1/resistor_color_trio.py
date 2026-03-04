COLORS = [
    "black", "brown", "red", "orange", "yellow",
    "green", "blue", "violet", "grey", "white"
]

def label(colors):
    main_value = COLORS.index(colors[0]) * 10 + COLORS.index(colors[1])
    multiplier = 10 ** COLORS.index(colors[2])
    ohms = main_value * multiplier

    if ohms >= 1_000_000_000:
        return f"{ohms // 1_000_000_000} gigaohms"
    elif ohms >= 1_000_000:
        return f"{ohms // 1_000_000} megaohms"
    elif ohms >= 1_000:
        return f"{ohms // 1_000} kiloohms"
    else:
        return f"{ohms} ohms"