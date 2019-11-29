int NORTHEAST = 1;
int EAST = 2;
int SOUTHEAST = 3;
int SOUTH = 4;
int SOUTHWEST = 5;
int WEST = 6;
int NORTHWEST = 7;
int NORTH = 8;

int stepSize = 2;
int diameter = 2;

int posX1;
int posY1;
int posX2;
int posY2;

void setup() {
  fullScreen();
  noStroke();
  fill(0, 40);
  background(255);
  
  posX1 = 0;
  posY1 = 0;
  posX2 = width;
  posY2 = height;
  
}

void draw() {
 
  ellipseMode(RADIUS);
  noStroke();
 
  for (float i = 0; i <= mouseX/2; i++) {
    int direction1;
    float q = random(0,1) ;
    if(q<0.05){
    direction1 = int(random(2, 5));
  }else{direction1 = int(random(1, 9));
  }

    if (direction1 == NORTH) {
      posY1 -= stepSize;
    } else if (direction1 == NORTHEAST) {
      posX1 += stepSize;
      posY1 -= stepSize;
    } else if (direction1 == EAST) {
      posX1 += stepSize;
    } else if (direction1 == SOUTHEAST) {
      posX1 += stepSize;
      posY1 += stepSize;
    } else if (direction1 == SOUTH) {
      posY1 += stepSize;
    } else if (direction1 == SOUTHWEST) {
      posX1 -= stepSize;
      posY1 += stepSize;
    } else if (direction1 == WEST) {
      posX1 -= stepSize;
    } else if (direction1 == NORTHWEST) {
      posX1 -= stepSize;
      posY1 -= stepSize;
    }

    if (posX1 > width) posX1 = 0;
    if (posX1 < 0) posX1 = width;
    if (posY1 < 0) posY1 = height;
    if (posY1 > height) posY1 = 0;
    
    fill(0,0,200,30);
    ellipse(posX1 + stepSize / 2, posY1 + stepSize / 2, diameter, diameter);
  }
  
  
for (float j = 0; j <= mouseY/2; j++) {
    int direction2;
    float q = random(0,1) ;
    if(q<0.05){
    direction2 = int(random(6, 9));
  }else{direction2 = int(random(1, 9));
  }

    if (direction2 == NORTH) {
      posY2 -= stepSize;
    } else if (direction2 == NORTHEAST) {
      posX2 += stepSize;
      posY2 -= stepSize;
    } else if (direction2 == EAST) {
      posX2 += stepSize;
    } else if (direction2 == SOUTHEAST) {
      posX2 += stepSize;
      posY2 += stepSize;
    } else if (direction2 == SOUTH) {
      posY2 += stepSize;
    } else if (direction2 == SOUTHWEST) {
      posX2 -= stepSize;
      posY2 += stepSize;
    } else if (direction2 == WEST) {
      posX2 -= stepSize;
    } else if (direction2 == NORTHWEST) {
      posX2 -= stepSize;
      posY2 -= stepSize;
    }

    if (posX2 > width) posX2 = 0;
    if (posX2 < 0) posX2 = width;
    if (posY2 < 0) posY2 = height;
    if (posY2 > height) posY2 = 0;

    fill(200,0,0,30);
    ellipse(posX2 + stepSize / 2, posY2 + stepSize / 2, diameter, diameter);
  }
   
}

void keyPressed() {
  if (key == 's' || key == 'S') save("myCanvas1.3.png");
   if (key == DELETE||key == BACKSPACE) {
      background(255);
  }

}
