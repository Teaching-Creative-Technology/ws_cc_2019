import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

class HC595():
    def __init__(self, serial_in, latch_clock, shift_clock, output_enable, reset):
        self._serial_in = serial_in
        self._latch_clock = latch_clock
        self._shift_clock = shift_clock
        self._output_enable = output_enable
        self._reset = reset

        # set direction of GPIO Pins
        GPIO.setup(self._serial_in, GPIO.OUT)
        GPIO.setup(self._latch_clock, GPIO.OUT)
        GPIO.setup(self._shift_clock, GPIO.OUT)
        GPIO.setup(self._output_enable, GPIO.OUT)
        GPIO.setup(self._reset, GPIO.OUT)

        GPIO.output(self._output_enable, GPIO.LOW)


    def reset(self):
        GPIO.output(self._reset, GPIO.LOW)
        time.sleep(0.1)
        GPIO.output(self._reset, GPIO.HIGH)
        time.sleep(0.1)
        self.latch()


    def enable_output(self):
        GPIO.output(self._output_enable, GPIO.LOW)

    def disable_output(self):
        GPIO.output(self._output_enable, GPIO.HIGH)

    def shift(self):

        GPIO.output(self._shift_clock, GPIO.HIGH)
        time.sleep(0.1)
        GPIO.output(self._shift_clock, GPIO.LOW)
        time.sleep(0.1)

    def latch(self):

        GPIO.output(self._latch_clock, GPIO.HIGH)
        time.sleep(0.1)
        GPIO.output(self._latch_clock, GPIO.LOW)
        time.sleep(0.1)


    def load_bit(self, bit):
       # load a single bit into shift register
       # bit is single character "0" or "1"
        if bit == "0":
            GPIO.output(self._serial_in, GPIO.LOW)
            self.shift()
        elif bit =="1":
            GPIO.output(self._serial_in, GPIO.HIGH)
            self.shift()

        else:
            raise ValueError("bit must be either '0' or '1' ")




    def load_shift_reg(self, data):
        pass


def main():
    hc595 = HC595(serial_in=5, latch_clock=6, shift_clock=13, output_enable=19, reset=26)
    hc595.reset()
    hc595.enable_output()



    hc595.load_bit("0")
    hc595.load_bit("1")
    hc595.load_bit("0")
    hc595.load_bit("1")
    hc595.load_bit("0")
    hc595.load_bit("1")
    hc595.load_bit("0")
    hc595.load_bit("1")

    hc595.latch()
    #time.sleep(5)
    hc595.load_bit("1")
    hc595.load_bit("0")
    hc595.load_bit("1")
    hc595.load_bit("0")
    hc595.load_bit("1")
    hc595.load_bit("0")
    hc595.load_bit("1")
    hc595.load_bit("0")

    hc595.latch()


if __name__ == '__main__':
    main()
