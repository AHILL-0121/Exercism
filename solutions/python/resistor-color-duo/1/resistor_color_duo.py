def value(colors):
    bands = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"]
    return bands.index(colors[0]) * 10 + bands.index(colors[1])