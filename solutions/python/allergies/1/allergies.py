ALLERGENS = [
    "eggs", "peanuts", "shellfish", "strawberries",
    "tomatoes", "chocolate", "pollen", "cats"
]

class Allergies:
    def __init__(self, score):
        self.score = score

    def allergic_to(self, item):
        index = ALLERGENS.index(item)
        return bool(self.score & (1 << index))

    @property
    def lst(self):
        return [a for i, a in enumerate(ALLERGENS) if self.score & (1 << i)]