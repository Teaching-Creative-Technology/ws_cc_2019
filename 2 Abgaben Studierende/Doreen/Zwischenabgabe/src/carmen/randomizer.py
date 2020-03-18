import string
import random

class Randomizer():
    def __init__(self, length):
        self.alphabet = list(string.ascii_lowercase)
        self.length = length
    def create_random_string(self):
        random_characters = random.sample(self.alphabet, self.length)
        return random_characters
