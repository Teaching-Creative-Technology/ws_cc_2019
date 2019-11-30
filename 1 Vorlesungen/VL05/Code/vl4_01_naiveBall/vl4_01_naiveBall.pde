float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;

void setup() {
  size(640,600);
  background(255);
  noStroke();
}
 
void draw() {
  background(255);
 
  x = x + xspeed;
  y = y + yspeed;
 
  if( (x > width) || (x < 0) ) {
    xspeed = xspeed * -1;
  }
  if( (y > height) || (y < 0) ) {
    yspeed = yspeed * -1;
  }
 
  fill(0);
  ellipse(x,y,16,16);
}
