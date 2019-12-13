 class Agent{    // Klassendefinitionen mit 

 PVector location;
 PVector velocity;
 PVector velocity2;
 PVector velocity3;
 PVector slower;
 float topspeed;
 float minspeed;
 
 
 Agent() {      // Konstruktor meiner Klasse 
 location = new PVector (random(10,width-10), random(10,height-10));
 velocity = new PVector (2.5,5);
 velocity2 = new PVector (7,10);
 velocity3 = new PVector (1,3);
 }
 
  void display (){
  for (int i = 0; i < 10; i++){
  noStroke();
  fill(250);
  circle (location.x,location.y,20);
  }
  }
  
  void stop (){
  mouseX = 0;
  mouseY = 0;
  }
  
  // Also code from the example
  void bounce()
  {
      velocity.x = velocity.x * -1;
      velocity.y = velocity.y * -1;
  }
 
  
  
  void move() {
    location.add(velocity);
    
    if ((location.x > width-10) || (location.x < 10)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height-10) || (location.y < 10)) {
      velocity.y = velocity.y * -1;
    }
  }
  
    void faster() {
    location.add(velocity2);
    
    if ((location.x > width-10) || (location.x < 10)) {
      velocity2.x = velocity2.x * -1;
    }
    if ((location.y > height-10) || (location.y < 10)) {
      velocity2.y = velocity2.y * -1;
    }
  }
  
  void slower() {
    location.add(velocity3);
    
    if ((location.x > width-10) || (location.x < 10)) {
      velocity3.x = velocity3.x * -1;
    }
    if ((location.y > height-10) || (location.y < 10)) {
      velocity3.y = velocity3.y * -1;
    }
  }
 
  /*
  PVector getlocation (){
  return location; 
  }
  

  
  boolean colliding (AgentB agentsB) {
    return dist(locationB.x, locationB.y, location.x,location.y) < 20;
  }
 
*/

 
 }    // class agent 
