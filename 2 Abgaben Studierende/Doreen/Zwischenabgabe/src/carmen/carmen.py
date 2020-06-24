# main
import word_processor
import randomizer
import ascii
import printer
import introduction
from word_display import WordDisplay
import time

class Carmen():
    """This is the main entry point
    An infinite loop generates random words with five characters.
    Each word is highlighted in white in the installation.
    If the random word is found in a list of german five character words then
    it is highlighted in blue, indicating a valid German word.
    The word then is sent to the line printer.

    The result is a random text - poetry by entropy


    """
    def __init__(self):
        self.wordprocessor = word_processor.WordProcessor(5)
        self.randomizer = randomizer.Randomizer(5)
        self.ascii = ascii.Ascii("big")
        self.printer = printer.Printer()
        self.introduction = introduction.Introduction()

    def go(self):
        self.introduction.printIntroduction()
        time.sleep(20)
        word_display = WordDisplay()

        while True:

            random_string = self.randomizer.create_random_string()

            # For every character in the word an available position
            # in the chain of lights is searched and highlighted in white

            word_display.setup_logical_position_register(random_string)
            word_display.highlight_logical_positions("white")
            time.sleep(1)

            # Now check what German words can be created with these characters
            my_words = self.wordprocessor.find_words_from_characters(random_string)


            if my_words:

                # Found German word, hightlighting in blue
                word_display.highlight_logical_positions("blue")

                # All matching words are converted to ascii art and sent to printer
                for my_word in my_words:
                    ascii_text = self.ascii.create_ascii_text(my_word)
                    self.printer.print_text(ascii_text)
                    print(ascii_text)
                time.sleep(8)


def main():
    carmen = Carmen()
    carmen.go()

if __name__ == '__main__':
    main()

