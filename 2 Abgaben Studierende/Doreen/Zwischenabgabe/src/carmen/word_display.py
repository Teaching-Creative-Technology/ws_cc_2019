import hc595
import random
import copy
from config import character_to_position_map


class WordDisplay():
    def __init__(self):
        self.shift_reg = hc595.ShiftRegister(serial_in=5, latch_clock=6, shift_clock=13,
                                             output_enable=19, reset=26, length=120)
        self.logical_postions_to_light_up = []
        self.local_character_to_position_map = copy.deepcopy(character_to_position_map)

    def find_position_for_character(self, character):
        # returns logical position for character
        upper_character = character.upper()

        # number of available logical positions for each character
        number_of_available_positions = len(self.local_character_to_position_map[upper_character])

        # random selection of one available logical positions for a character
        random_position = random.sample(range(number_of_available_positions), 1)[0]

        # get and delete element on logical position
        logical_position = self.local_character_to_position_map[upper_character].pop(random_position)
        return logical_position

    def setup_logical_position_register(self, word):
        # function gets word
        # for each character in word a logical position is searched
        for character in word:
            self.logical_postions_to_light_up.append(self.find_position_for_character(character))


    def highlight_logical_positions(self, state):

        for position in self.logical_postions_to_light_up:
            self.shift_reg.set_logical_position_to_value(position, state)
        self.shift_reg.load_logical_values_into_shift_register()

