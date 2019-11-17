void setup() {
  size(400, 400);
}

void draw() {
  pushMatrix();
  translate(20, 20);
  rect(0, 0, 40, 40);
  popMatrix();
  
  pushStyle();
  fill(255, 0, 0);
  rect(0,0, 40, 40);
  popStyle();
}
