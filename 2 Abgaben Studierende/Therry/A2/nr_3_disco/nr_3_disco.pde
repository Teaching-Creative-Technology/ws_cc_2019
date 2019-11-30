float q = 0.03;

void setup() {
size(700, 700);
rectMode(CENTER);
frameRate(24);
//noLoop();
strokeWeight(0.6);
//noStroke();
noFill();
smooth();
}


void draw() {
background(100);
translate(160, 160);

q = q + 0.03;


for (int y = 0 ; y < 5; y++) {
for (int x = 0 ; x < 5; x++) {
pushMatrix();
//fill( random(155,255));
translate(x *90, y * 90);
rotate(q);
rect(0, 0, 160, 160);


popMatrix(); 
}
}}
