void setup(){
  size(600,600,P3D);
  background(#000000);
  
  noFill();
}

void draw(){
  
  pushMatrix();
  stroke(255);
  translate(100, height*0.35, 100);
  strokeWeight(0.5);
  sphere(100);
  popMatrix();
  
  pushMatrix();
  stroke(#FF69B4);
  translate(500, height*0.9, -100);
  strokeWeight(0.5);
  sphere(90);
  popMatrix();
  
  pushMatrix();
  stroke(#FF69B4);
  translate(200, height*0.50, 0);
  strokeWeight(0.5);
  sphere(200);
  popMatrix();
}
