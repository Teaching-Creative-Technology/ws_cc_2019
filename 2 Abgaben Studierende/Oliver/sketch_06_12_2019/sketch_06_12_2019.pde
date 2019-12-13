int x = width/2;
int y = height/2;
float stepx = 1;
int stepy = 1;
int num = 25;

Agent[] agents = new Agent[num];    // Array-Klasse aus der Objekte erstellt werden 
AgentB[] agentsB = new AgentB[num];
// Refugee myRefugee;
// schau dir mal get an
int state = 0;
 
final int state0stop = 0; 
final int state1move = 1;
final int state2faster = 2;
final int state3slower = 3;

  
void setup(){
  size (500,500);
  background (50);
  frameRate (60);
  
  for (int i=0; i < agents.length; i++) {
      agents[i] = new Agent();    //hier wird ein Objekt aus meiner Klasse erstellt 
  }
    
  for (int j=0; j < agentsB.length; j++) {
      agentsB[j] = new AgentB();    //hier wird ein Objekt aus meiner Klasse erstellt 
  }  
}


void draw() {

fill (150,100);
rect(0,0,width,height);


/*
for(int i=0; i < agents.length; i++) {
    for(int j=0; j < agentsB.length; j++){
      if (colliding){
        velocity.x = velocity.x * -1;
        velocity.y = velocity.y * -1;
        velocityB.x = velocityB.x * -1;
        velocityB.y = velocityB.y * -1;
      }
    }
  }
*/



for (int i = 0; i < agents.length; i++) {
      agents[i].display();     
}
    // depending on state 
  if (state == state0stop)
  {
    for (int i = 0; i < agents.length; i++) {
      agents[i].stop();
    } // for
  } // if 
  if (state == state1move)
  {
    for (int i = 0; i < agents.length; i++) {
      agents[i].move();
    } // for
  } // if 
  if (state == state2faster)
  {
    for (int i = 0; i < agents.length; i++) {
      agents[i].faster();
    } // for
  } // if 
  if (state == state3slower)
  {
    for (int i = 0; i < agents.length; i++) {
      agents[i].slower();
    } // for
  } // if 
   






for (int i = 0; i < agentsB.length; i++) {
      agentsB[i].display();
      
}
    // depending on state 
  if (state == state0stop)
  {
    for (int i = 0; i < agentsB.length; i++) {
      agentsB[i].stop();
    } // for
  } // if 
  if (state == state1move)
  {
    for (int i = 0; i < agentsB.length; i++) {
      agentsB[i].move();
    } // for
  } // if 
  if (state == state2faster)
  {
    for (int i = 0; i < agentsB.length; i++) {
      agentsB[i].faster();
    } // for
  } // if 
  if (state == state3slower)
  {
    for (int i = 0; i < agentsB.length; i++) {
      agentsB[i].slower();
    } // for
  } // if 
   
}    //draw



void mousePressed() {
    state +=1;
    if (state > 3){
      state = 0;
    }
    
   if (state == 0)
   {
     state = state0stop;
   }
   else if (state == 1)
   {
     state = state1move;
   }
   else if (state == 2)
   {
     state = state2faster;
   }
   else if (state == 3)
   {
     state = state3slower;
   }
  }


 

 
 
