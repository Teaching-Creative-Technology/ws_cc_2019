# main
import word_processor
import randomizer
import ascii

class Carmen():
    def __init__(self):
        self.wordprocessor = word_processor.WordProcessor(5)
        self.randomizer = randomizer.Randomizer(5)
        self.ascii = ascii.Ascii("big")

    def go(self):
        found_words = 0
        while found_words <10:
            random_string = self.randomizer.create_random_string()
            print(random_string)

            my_words = self.wordprocessor.find_words_from_characters(random_string)

            if my_words:
                print("Found something")
                for my_word in my_words:
                    ascii_text = self.ascii.create_ascii_text(my_word)
                    print(ascii_text)
                found_words +=1
        # process words, display etc..
        print("Bye Bye....")


def main():
    carmen = Carmen()
    carmen.go()

if __name__ == '__main__':
    main()

