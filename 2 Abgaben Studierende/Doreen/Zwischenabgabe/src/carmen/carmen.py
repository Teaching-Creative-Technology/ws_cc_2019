# main
import word_processor
import randomizer
import ascii
import printer
import hc595
from word_display import WordDisplay
import time

class Carmen():
    def __init__(self):
        self.wordprocessor = word_processor.WordProcessor(5)
        self.randomizer = randomizer.Randomizer(5)
        self.ascii = ascii.Ascii("big")
        self.printer = printer.Printer()

    def go(self):
        found_words = 0
        while found_words < 10:
            random_string = self.randomizer.create_random_string()
            print(random_string)
            word_display = WordDisplay()
            word_display.setup_logical_position_register(random_string)
            word_display.highlight_logical_positions("white")
            time.sleep(0.5)
            my_words = self.wordprocessor.find_words_from_characters(random_string)


            if my_words:
                print("Found matching word {0}".format(my_words[0]))
                word_display.highlight_logical_positions("blue")
                time.sleep(16)

                for my_word in my_words:
                    ascii_text = self.ascii.create_ascii_text(my_word)
                    self.printer.print_text(ascii_text)
                    print(ascii_text)
                found_words +=1

            #time.sleep(5)


def main():
    carmen = Carmen()
    carmen.go()

if __name__ == '__main__':
    main()

