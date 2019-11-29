import processing.svg.*;
int a;
int c;
float x=random(0,TWO_PI);
float speedr = 0.2;    // Geschwindigkeit mit der sich R, G und B-Farbwerte durch Addition verändern
float speeds = 1;      // Geschwindigkeit mit der sich Länge des Arcs verändert
float r = 255;    // Start-Farbwerte
float s = 2;
boolean record;


void setup(){
size (900, 900);
background(255);
frameRate(20);
}

void draw() {


for (a = 150; a < width; a += 300){      // doppelte for-Schleife um Raster aufzubauen
for (c = 150; c < height; c += 300){
    r= r + speedr;
    s = s+ speeds;


    r=constrain(r, 0, 255);    // Werte werden zwischen 0 und 255 gehalten

    if (r==255 || r==0) {    // Endlosschleife des Farbwechsels
      speedr= speedr * -1;
    }
    if (s==200 || s==1) {    //Endlosschleife der Arc-Bewegung
      speeds= speeds * -1;
    }
    s = constrain(s,0,200);
    
fill(r);
noStroke();
arc(a,c,s,s,0+x,0.2+x);
x=x+0.001;
  
   if (record) {    // Dokumentationshilfe für Screenshot
    saveFrame("line-######.png");
  }

  if (record) {
    endRecord();
    record = false;
  }
}}
}
void mousePressed() {
  record = true;
}
