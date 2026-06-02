class Garden:
    DEFAULT_STUDENTS = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred",
                        "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]
    PLANTS = {"G": "Grass", "C": "Clover", "R": "Radishes", "V": "Violets"}

    def __init__(self, diagram, students=None):
        self.rows = diagram.split("\n")
        self.students = sorted(students if students else self.DEFAULT_STUDENTS)

    def plants(self, student):
        idx = self.students.index(student)
        return [self.PLANTS[self.rows[r][idx * 2 + c]] for r in range(2) for c in range(2)]