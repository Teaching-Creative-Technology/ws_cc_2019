Ring[] rings;
int numRings = 50;
int currentRing = 0; 

void setup() {
  size(600, 600);
  rings = new Ring[numRings];
  for (int i = 0; i < rings.length; i++) {
    rings[i] = new Ring();
  }
}

void draw() {
  background(255);
  for (int i = 0; i < rings.length; i++) {
    rings[i].grow();
    rings[i].display();
  }
}


void mousePressed() {
  rings[currentRing].start(mouseX, mouseY);
  currentRing++;
  if (currentRing >= numRings) {
    currentRing = 0;
  }
}

class Ring {
  float x, y;
  float diameter;
  boolean on = false;

  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos; 

    diameter = 1;
    on = true;
  }
  
  void grow() {
    if (on == true) {
      diameter += 0.5;
      if (diameter > 400) {
        on = false;
        diameter = 1;
      }
    }
  }

  void display() {
    if (on == true) {
      noFill();
      strokeWeight(2);
      stroke(0, 153);
      ellipse(x, y, diameter, diameter);
    }
  }
}
