import pyfiglet
from pyfiglet import Figlet

class Ascii():

    def __init__(self, font, text):
        self.font = font
        self.font_list = ["big", "doom", "isometric1", "isometric3", "larry3d", "stop", "standard", "small", "shadow",
                     "rectangles", "kban", "fender", "chunky", "block"]
        self.text = text

    def printText(self):
        custom_fig = Figlet(font = self.font)
        print(custom_fig.renderText(self.text))


