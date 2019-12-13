 class AgentB{    // Klassendefinitionen mit 

 PVector location;
 PVector velocity;
 PVector velocity2;
 PVector velocity3;
 PVector slower;
 float topspeed;
 float minspeed;
 
 AgentB() {      // Konstruktor meiner Klasse 
 location = new PVector (random(10,width-10), random(10,height-10));
 velocity = new PVector (2.5,5);
 velocity2 = new PVector (7,10);
 velocity3 = new PVector (1,3);
 }
 
  void display (){
  for (int i = 0; i < 10; i++){
  noStroke();
  fill(50);
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
  boolean collision () {
  for (int i=0; i < agents.length; i++) {
    PVector temp = agents[i].getlocation;
    float collision = dist(temp.x, temp.y, location.x,location.y);
    if(collision < 20) return true;
    else return false;
  }
  }
      
  
  PVector getlocation (){
  return location; 
  }
  
// collision detection, eine array klasse 1 Objekt rausziehen --> ansonsten Perfomance Problem mit zwei Arrays  
// versuch mal deine sachen zu pushen im git 

 }
 
 */
  }    // class agent 
