from nltk.corpus import words

class WordProcessor():
    """
    This class generates a list of all possible n-character words
    Algorithm:
        * select all words of length n from an Englisch dictionary
        * process all words and generate an index consisting of all letters in the word
        * group the words by the index

    Now all words that can be build from a collection of characters can easily be detected


    """
    def __init__(self, word_length=8):
        self.n_character_word_list = []
        self.word_length = word_length
        self.character_to_word_map = dict()
        self.create_n_character_word_list(word_length)
        self.sort_words_into_index()

    def create_n_character_word_list(self, n):
        word_list = words.words()
        for word in word_list:
            if len(word) == n:
                self.n_character_word_list.append(word)

    def create_word_index(self, word):
        """Sorting characters of a word to make an index out of it"""
        index = ''.join(sorted(word))
        return index

    def sort_words_into_index(self):
        for word in self.n_character_word_list:
            index = self.create_word_index(word.lower())
            if self.character_to_word_map.get(index):
                self.character_to_word_map[index].append(word)
            else:
                self.character_to_word_map[index] = []
                self.character_to_word_map[index].append(word)

    def find_words_from_characters(self, characters):
        index = ''.join(sorted(characters)).lower()
        possible_words = self.character_to_word_map.get(index)
        return possible_words
