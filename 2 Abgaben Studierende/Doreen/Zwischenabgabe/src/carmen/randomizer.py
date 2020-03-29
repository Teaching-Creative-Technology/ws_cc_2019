import string
import random
from config import character_to_position_map
# Class that creates a random set of characters from the alphabet
# with a specific length



class Randomizer():
    def __init__(self, length):
        self.alphabet = list(string.ascii_lowercase)
        self.length = length
        self.character_list = self.create_character_list()
    def create_random_string(self):
        random_characters = random.sample(self.alphabet, self.length)
        #random_characters = random.sample(self.character_list, self.length)
        return random_characters


    def create_character_list(self):
        my_characters = []
        for _char in character_to_position_map.keys():
            for _pos in character_to_position_map[_char]:
                my_characters.append(_char)
        return my_characters