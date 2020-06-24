import printer
import ascii

class Introduction():
    def __init__(self):
        self.printer = printer.Printer()
        self.ascii = ascii.Ascii("big")
        #self.font_list = ["big", "doom", "isometric1", "isometric3", "larry3d", "stop", "standard", "small", "shadow",
        #                  "rectangles", "kban", "fender", "chunky", "block"]

        self.text = "Die Poesie der Entropie \n\n" \
                    "Ordnung ist Symmetrie. \nSymmetrie ist Schoenheit.\n\nIn einer von den " \
                    "Kraeften der Entropie beherrschten Welt\nist Schoenheit selten und unwahrscheinlich.\n" \
                    "Und doch gibt es Schoenheit ueberall.\nBuecher koennen schoen sein, wenn sie eine gute " \
                    "Geschichte erzaehlen.\nGute Geschichten sind eine Ansammlung wohl formulierter Saetze,\n" \
                    "welche aus sorgfaeltig ausgewaehlten Worten bestehen.\nWorte bestehen aus Buchstaben.\n" \
                    "Worte sind die logische Aneinanderreihung\nausgewaehlter Buchstaben des Alphabets.\n\n" \
                    "Schoenheit ist Ordnung. \nSchoenheit sind Buchstaben. \nSchoenheit ist die Ordnung von Buchstaben. "


    def printIntroduction(self):
        self.printer.print_text(self.text)


