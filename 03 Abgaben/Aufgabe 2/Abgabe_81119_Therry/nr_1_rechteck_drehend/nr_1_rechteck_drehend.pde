float angle;
float jitter;

void setup() {
  size(800,800);
 // background(250);
  rectMode(CENTER);
  smooth();
  frameRate(24);

  
   }

void draw (){
 // fill(255,255,255, 2.5);
 // rect(400, 400, width, height);
  
  strokeWeight(0.2);
  noFill();
  
  
   if (second() % 5 == 0) {  
    jitter = random(-0.2, 0.2);
    
   }
  
  
  

  
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2,height/2);
  rotate(c);
  rect(0,0,500,400);


}
  
