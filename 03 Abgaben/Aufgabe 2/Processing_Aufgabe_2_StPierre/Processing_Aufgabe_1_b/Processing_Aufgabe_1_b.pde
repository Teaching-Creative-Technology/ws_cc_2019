// values for rotation of figures
float rotationX = 2.5;
float rotationY = 2.5;

// timer
int timer = 40;

// countdown
boolean counter = true;

// picturenumber
int picturenumber = 0;

void setup() {
  size(800, 800, P3D);
  frameRate(10);
  background(0);
}

// function for basis picture
void basis() {
  for (int i=0; i <= 40; i++) {

    // set value for rotation around x-axis
    rotationX=rotationX + 2.5;

    // rotate around x-axis
    rotateX(rotationX);

    // draw triangle
    triangle(280, 650, 400, 400, 520, 650);
  }
}


void draw() {
  stroke(255);
  noFill();

  // set counter 
  if (timer == 0) {
    counter = false;
    background(0);
    timer = 40;
    counter = true;
  }

  // countdown draw first branch 
  else if (timer != 0 && counter == true) {
    timer--;
    basis();

    if (keyPressed) {
      if (key == 's' || key == 'S') {
        save("Picture_" + picturenumber + ".jpg");
        picturenumber++;
      }
    }
  }
}
