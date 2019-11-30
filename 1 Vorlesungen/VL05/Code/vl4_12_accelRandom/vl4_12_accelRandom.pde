Mover m;

void setup() {
  size(600, 600);
  m = new Mover();
}

void draw() {
  background(255);
  m.update();
  m.checkEdges();
  m.display();
}

class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(random(-2,2),random(-2,2));
    acceleration = PVector.random2D();
    topspeed = 4;
  }
  
 void update() {
   acceleration = PVector.random2D();
   acceleration.mult(0.5);
   //acceleration.mult(random(2));
   
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity);
  }
 
  void display() {
    noStroke();
    fill(0);
    ellipse(location.x,location.y,16,16);
  }
  
  
  
 
 void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
 
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
 
  }
}
