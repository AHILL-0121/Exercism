EAST = 0
NORTH = 1
WEST = 2
SOUTH = 3

class Robot:
    def __init__(self, direction=NORTH, x_pos=0, y_pos=0):
        self.direction = direction
        self.x = x_pos
        self.y = y_pos

    @property
    def coordinates(self):
        return (self.x, self.y)

    def move(self, instructions):
        for instruction in instructions:
            if instruction == 'R':
                self.direction = (self.direction - 1) % 4
            elif instruction == 'L':
                self.direction = (self.direction + 1) % 4
            elif instruction == 'A':
                if self.direction == NORTH:
                    self.y += 1
                elif self.direction == SOUTH:
                    self.y -= 1
                elif self.direction == EAST:
                    self.x += 1
                elif self.direction == WEST:
                    self.x -= 1