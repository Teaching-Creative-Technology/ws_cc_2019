//2019, Aufgabe 01, Doreen St. Pierre

int center_x = 400;
int center_y = 400;
float radius = 300;
int angle = 0;
int alternate = 0;


void setup() {
  size(800, 800);
  background(0);
  smooth(10);
  }

void draw() {
  
  for (float angle =0; angle <= PI; angle = angle+0.02) {
    // draw lines from top
    stroke(255);
    if (alternate%2 == 0) {
      line(center_x + cos(angle) * radius, center_y - sin(angle) * radius, center_x + cos(angle) * radius, 800);
    }
    // draw lines from bottom
    else {
      stroke(255);
      line(center_x + cos(angle) * radius, center_y + sin(angle) * radius, center_x + cos(angle) * radius, 0);
    }
    alternate++;
    
  } 
    noLoop();
    save("Picture.jpg");
}
