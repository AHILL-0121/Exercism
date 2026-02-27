def inequality(sides):
    return (sides[0] + sides[1] > sides[2]) and (sides[1] + sides[2] > sides[0]) and (sides[0] + sides[2] > sides[1])

def equilateral(sides):
    return (sides[0] == sides[1] == sides[2] != 0) and inequality(sides)

def isosceles(sides):
    return ((sides[0] == sides[1] or sides[1] == sides[2]) or (sides[0] == sides[2])) and inequality(sides)

def scalene(sides):
    return (sides[0] != sides[1] != sides[2] != sides[0]) and inequality(sides)
