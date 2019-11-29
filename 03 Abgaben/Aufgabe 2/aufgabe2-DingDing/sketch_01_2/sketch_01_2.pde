int Count = 10;
float shapeAngle = 0;

int tileWidth;
int tileHeight;

void setup() {
  size(800,800);
  
}

void draw() {
  background(255);
  
  tileWidth = width / Count;
  tileHeight = height / Count;
  rectMode(RADIUS);
  noStroke();
  
  for (int gridY = 0; gridY < Count; gridY++) {
    for (int gridX = 0; gridX < Count; gridX++) {

      int posX = tileWidth * gridX + tileWidth / 2;
      int posY = tileHeight * gridY + tileWidth / 2;

      // calculate angle between mouse position and actual position of the shape
      float angle = atan2(mouseY - posY, mouseX - posX) + (shapeAngle * (PI / 180));
      
      
      pushMatrix();
      translate(posX, posY);
      fill(200); 
      rect(0, 0, 25, 25); 
      rotate(angle);
      fill(0); 
      rect(0, 0, 20, 20); 
      popMatrix();
   
  }
 }
}

void keyPressed() {
  if (key == 's' || key == 'S') save("myCanvas1.2.png");

}
