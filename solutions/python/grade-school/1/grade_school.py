class School:
    def __init__(self):
        self._grades = {}
        self._added = []

    def add_student(self, name, grade):
        for students in self._grades.values():
            if name in students:
                self._added.append(False)
                return
        self._grades.setdefault(grade, []).append(name)
        self._added.append(True)

    def roster(self):
        return [
            student
            for grade in sorted(self._grades)
            for student in sorted(self._grades[grade])
        ]

    def grade(self, grade_number):
        return sorted(self._grades.get(grade_number, []))

    def added(self):
        return self._added