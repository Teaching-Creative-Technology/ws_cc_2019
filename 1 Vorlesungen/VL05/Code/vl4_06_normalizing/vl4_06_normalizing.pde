// Normalisieren. Etwas auf einen Standard bringen
// Im Falle von Vektoren ist das eine Länge / Größe (Magnitude) von 1.
// oder auch der Einheitsvektor

// Hatten wir vorher einen Vektor mit der Länge 10, ist er nun nur noch 1 "groß"
// Wir haben also unseren Vektor auf 1 normalisiert und um 50 multipliziert.

void setup() {
  size(600,600);
  strokeWeight(3);
}
 
void draw() {
  background(255);
  PVector mouse  = new PVector(mouseX,mouseY);
  PVector center = new PVector(width/2,height/2);

  mouse.sub(center);
  
  mouse.normalize();
  mouse.mult(50);

  translate(width/2,height/2);
  line(0,0,mouse.x,mouse.y);
}
