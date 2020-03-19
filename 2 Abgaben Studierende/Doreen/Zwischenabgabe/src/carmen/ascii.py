from pyfiglet import Figlet
        # self.font_list = ["big", "doom", "isometric1", "isometric3", "larry3d", "stop", "standard", "small", "shadow",
        #             "rectangles", "kban", "fender", "chunky", "block"]

class Ascii():
    def __init__(self, font):
        self.font = font

    def create_ascii_text(self, text):
        custom_fig = Figlet(font=self.font)
        return custom_fig.renderText(text)
