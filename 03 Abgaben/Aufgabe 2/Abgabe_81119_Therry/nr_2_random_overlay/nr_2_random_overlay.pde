void setup () {
  size(1000, 1000);
  background(250);
  smooth();
  frameRate(24); 
  noStroke();
}
 
void draw() {
  int posX, posY;
  
  
  
  for (int i=0; i<40; i=i+1) {
    posX = int(random(width));
    posY = int(random(height));
    Raster(posX, posY);
  }
}
 
void Raster (int x, int y) {
  int size;
  size = int(random(5,100));
   
  pushMatrix();
  translate(x, y);
  fill(random(0,250), random(2,100));
 
  
ellipse(0, 0, size, size);
  popMatrix();
}
