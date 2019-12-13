// Unsere States als Konstanten
final int RUHEZUSTAND = 0;
final int PULSIEREN = 1;
final int WIGGLE = 2;

int state = 0;

long timestamp = 0;
long interval = 5000; // in ms 

boolean inputEnabled = false;

void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  stateMachine();
}

void keyPressed() {
  if(inputEnabled) {
    
    if (key == '1') {
      state = PULSIEREN;
      println("Wechseln in den State= PULSIEREN");
      inputEnabled = false;
      timestamp = millis();
    } else if (key == '2') {
      state = WIGGLE;
      println("Wechseln in den State= WIGGLE");
      inputEnabled = false;
      timestamp = millis();
    }
    
  } // <end= inputEnable>
}
