import word_processor
import randomizer

class Carmen():
    def __init__(self):
        self.wordprocessor = word_processor.WordProcessor(5)
        self.randomizer = randomizer.Randomizer(5)

    def go(self):
        found_words = 0
        print("Starting Carmen...")
        while found_words <10:
            random_string = self.randomizer.create_random_string()
            print(random_string)

            my_words = self.wordprocessor.find_words_from_characters(random_string)
            #print(my_words)

            if my_words:
                print("Found something")
                print(my_words)
                found_words +=1
        # process words, display etc..
        print("Bye Bye....")



def main():
    carmen = Carmen()
    carmen.go()

if __name__ == '__main__':
    main()

