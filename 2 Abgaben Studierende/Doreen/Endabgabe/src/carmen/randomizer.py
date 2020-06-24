import string
import random


# Class that creates a random set of characters from the alphabet
# with a specific length


class Randomizer():
    def __init__(self, length):
        self.alphabet = list(string.ascii_lowercase)
        self.length = length
        # Using a fixed seed to ensure good results can be repeated during exhibition
        random.seed(4208154711)

    def create_random_string(self):
        random_characters = random.sample(self.alphabet, self.length)
        return random_characters

