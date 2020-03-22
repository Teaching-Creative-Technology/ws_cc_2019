import subprocess
import ascii

class Printer():

    def print_text(self, printtext):
        # input text is encoded with utf-8 to make it readable for the printer
        ascii_printtext = printtext.encode('utf-8')

        # a temporary file is created to print the input
        with open("/tmp/prt_output.txt", 'w') as temp_printfile:
            temp_printfile.write(ascii_printtext)

        # call lp to print file
        subprocess.call(["/usr/bin/lp /tmp/prt_output.txt"],shell=True)

