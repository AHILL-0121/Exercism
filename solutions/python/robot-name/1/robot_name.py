import random
import string

class Robot:
    _used_names = set()

    def __init__(self):
        self._name = self._generate_name()

    @property
    def name(self):
        return self._name

    def reset(self):
        self._name = self._generate_name()

    @classmethod
    def _generate_name(cls):
        while True:
            name = (
                random.choice(string.ascii_uppercase) +
                random.choice(string.ascii_uppercase) +
                str(random.randint(0, 9)) +
                str(random.randint(0, 9)) +
                str(random.randint(0, 9))
            )
            if name not in cls._used_names:
                cls._used_names.add(name)
                return name