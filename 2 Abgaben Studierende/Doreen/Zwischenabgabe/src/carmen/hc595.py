import RPi.GPIO as GPIO
import time
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

SLEEP_TIME = 0.001
# This class sets up and controls the HC595 components
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
        time.sleep(SLEEP_TIME)
        GPIO.output(self._reset, GPIO.HIGH)
        time.sleep(SLEEP_TIME)
        self.latch()


    def enable_output(self):
        GPIO.output(self._output_enable, GPIO.LOW)

    def disable_output(self):
        GPIO.output(self._output_enable, GPIO.HIGH)

    def shift(self):

        GPIO.output(self._shift_clock, GPIO.HIGH)
        time.sleep(SLEEP_TIME)
        GPIO.output(self._shift_clock, GPIO.LOW)
        time.sleep(SLEEP_TIME)

    def latch(self):

        GPIO.output(self._latch_clock, GPIO.HIGH)
        time.sleep(SLEEP_TIME)
        GPIO.output(self._latch_clock, GPIO.LOW)
        time.sleep(SLEEP_TIME)


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

# This class creates and transmits the bit patterns for the Shift Registers
class ShiftRegister():
    def __init__(self, serial_in, latch_clock, shift_clock, output_enable, reset, length):
        self.hc595 = HC595(serial_in, latch_clock, shift_clock, output_enable, reset)
        self.length = length
        self.hc595.reset()
        self.logical_register = ["00" for item in range(length//2)]
        self.physical_register = ""


        # length is the physical position of the bit in the shift chain
        #             +-------------+      +-----------+            +-----------+
        #             |             |      |           |            |           |
        #             |    HC595    +------+   HC595   +-+ ++ ++ ++ |   HC595   |
        #             |             |      |           |            |           |
        #             +-+-+-+-+-+-+-+      +-----------+            +-----------+
        #             + + + + + + + +
        #
        # Physical    0 1 2 3 4 5 6 7
        # Physical Position is a single bit in the shift register that can be on or occ
        #
        #
        # Logical      0   1   2   3
        # Logical Position is a letter, a letter can have 3 states (blue, white or off),
        # the state is mapped to a pair of two physical bits


        if length > 120:
            raise ValueError("Maximum register legth exceeded")

    def map_state_to_bit_pattern(self, state):
        # value is either blue, white or off
        if state not in ["blue", "white", "off"]:
            raise ValueError("Invalid value for state")

        # Logical position has to be smaller than half the shift register size
        #if logical_position > self.length/2 - 1:
        #    raise ValueError("Invalid value for logical position")

        # the three possible states are mapped to the bit pattern they can be accessed with
        bit_pattern = "00"

        if state == "blue":
            bit_pattern = "10"

        elif state == "white":
            bit_pattern = "01"

        elif state == "off":
            bit_pattern = "00"

        return bit_pattern

    # Function to set a state at a logical position
    def set_logical_position_to_value(self, logical_position, state):
        self.logical_register[logical_position] = self.map_state_to_bit_pattern(state)

    # Function that creates a string of the sequence of bits that resemble the physical shift register
    def map_logical_register_to_physical_bits(self):
        self.physical_register = "" .join(self.logical_register)
        #print(self.physical_register)

    # Function to reverse the phsyical bits, so they can be loaded into the shift register
    def load_physical_bits_into_shift_register(self):
        #print("".join(reversed(self.physical_register)))
        for bit in reversed(self.physical_register):
            self.hc595.load_bit(bit)

    # Function to load bit string into shift register
    def load_logical_values_into_shift_register(self):
        self.map_logical_register_to_physical_bits()
        self.load_physical_bits_into_shift_register()
        self.hc595.latch()

def main():
    shift_reg = ShiftRegister(serial_in=5, latch_clock=6, shift_clock=13, output_enable=19, reset=26, length = 120)

    shift_reg.set_logical_position_to_value(19, "off")
    shift_reg.load_logical_values_into_shift_register()


if __name__ == '__main__':
    main()
