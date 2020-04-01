# main
import word_processor
import randomizer
import ascii
import printer
import introduction
import hc595
from word_display import WordDisplay
import time

class Carmen():
    def __init__(self):
        self.wordprocessor = word_processor.WordProcessor(5)
        self.randomizer = randomizer.Randomizer(5)
        self.ascii = ascii.Ascii("big")
        self.printer = printer.Printer()
        self.introduction = introduction.Introduction()

    def go(self):
        self.introduction.printIntroduction()
        time.sleep(20)

        while True:
            random_string = self.randomizer.create_random_string()
            print(random_string)
            word_display = WordDisplay()
            word_display.setup_logical_position_register(random_string)
            word_display.highlight_logical_positions("white")
            time.sleep(1)
            my_words = self.wordprocessor.find_words_from_characters(random_string)


            if my_words:
                print("Found matching word {0}".format(my_words[0]))
                word_display.highlight_logical_positions("blue")

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

