import random
import string

class Cipher:
    def __init__(self, key=None):
        self.key = key if key else ''.join(random.choices(string.ascii_lowercase, k=100))

    def encode(self, text):
        return ''.join(
            chr((ord(c) - ord('a') + ord(self.key[i % len(self.key)]) - ord('a')) % 26 + ord('a'))
            for i, c in enumerate(text)
        )

    def decode(self, text):
        return ''.join(
            chr((ord(c) - ord(self.key[i % len(self.key)]) + 26) % 26 + ord('a'))
            for i, c in enumerate(text)
        )