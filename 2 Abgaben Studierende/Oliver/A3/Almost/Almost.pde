// 2D Array of objects
Moth[][] moths;

PGraphics flowers;

// Anzahl der rows and grids

int cols = 3;
int rows = 3;
float d = random(0,TWO_PI);
float m;
  
void setup() { 
  background(15);
  size(900,900);
  flowers = createGraphics(900, 900);    // G Graphic Layer wird erstellt
  moths = new Moth[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      moths[i][j] = new Moth(150+i*300, 150+j*300, i+1, i/2, 2, 0.5);    // Initialisierung der Motten
    }
  }
}

void draw() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      moths[i][j].display();      // Funktion, die die moths in jedem darüber angesprochenen Platz anzeigt
    }
  }
}

class Moth {
  float x,y;   // x,y location
  float s, r;   // width and height
  float speedS, speedR; // angle for oscillating brightness

  // Objekt Konstrukteur mit temporären Variablen
  Moth(float tempX, float tempY, float tempS, float tempR, float tempSpeedS, float tempSpeedR) {
    x = tempX;
    y = tempY;
    s = tempS;
    r = tempR;
    speedS = tempSpeedS;
    speedR = tempSpeedR;
  } 
  
  void display(){
    flowers.beginDraw();
    flowers.fill(r);
    flowers.noStroke();
    flowers.arc(x,y,s,s,d+((x+y)/700),0.1+d+((x+y)/700));    // letzten beiden Ziffern entscheiden darüber, in welchem INtervall die Blätter gebildet werden 
    flowers.endDraw();
    
    image(flowers, 0, 0);
    d += 0.0007;             // Bestimmt Breite der Blütenblätter
    
    r = r + speedR;          // Geschwindigkeit des Farbwechsels
    if (r==255 || r==0) {    // Endlosschleife des Farbwechsels
      speedR = speedR * -1;
    }
    
    s = s + 2*speedS;          // Geschwindigkeit mit der sich die Blüten bilden 
    if (s > 200 || s < 0) {    //Endlosschleife der Arc-Bewegung
      speedS = speedS * -1;
    }
  }  
}

// Wie kann ich jede Blüte auf ein einzelnes Quadrat packen 
// und sich entsprechend der mouseX/ mouseY Position drehen lassen? 
// muss wahrscheinlich irgendwie in den Array 
