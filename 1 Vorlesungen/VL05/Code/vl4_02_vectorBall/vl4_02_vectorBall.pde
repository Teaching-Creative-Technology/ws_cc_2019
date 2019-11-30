PVector location = new PVector(100, 100);
PVector velocity = new PVector(1, 3.3); 

void setup() {
  size(640,600);
  background(255);
  noStroke();
}
 
void draw() {
  background(255);
 
  location.add(velocity);
 
  if ((location.x > width) || (location.x < 0)) {
    velocity.x = velocity.x * -1;
  }
  if ((location.y > height) || (location.y < 0)) {
    velocity.y = velocity.y * -1;
  }
 
  fill(0);
  ellipse(location.x,location.y,16,16);
}
