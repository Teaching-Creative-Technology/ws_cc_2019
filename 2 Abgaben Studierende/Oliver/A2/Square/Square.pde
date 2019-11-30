BoxClass[][][] boxes = new BoxClass[3][3][1]; // Array Umfang für 3D Objekte bestimmen
boolean record;
void setup() {
  size(1000, 1000, P3D);
  defineBoxes();     //Konstruktor wird aufgerufen
} 
 
void draw() {
  background(255);
  lights();

 
  for (int i = 0; i < boxes.length; i++) {
    for (int j = 0; j < boxes[i].length; j++) {
      for (int k = 0; k < boxes[i][j].length; k++) {
        boxes[i][ j][k].show();      // Initialisierung der Objekte/ Instanzen
      }
    }
  }  
  
  
  if (record) {    // Dokumentationshilfe für Screenshot
    saveFrame("line-######.png");
  }

  if (record) {
    endRecord();
    record = false;
  }
} 
 
void defineBoxes() {            // Konstruktor
  for (int i = 0; i < boxes.length; i++) {
    for (int j = 0; j < boxes[i].length; j++) {
      for (int k = 0; k < boxes[i][j].length; k++) {
        boxes[i][j][k] = new BoxClass( 400 + i*(height/10), 400 + j*(height/10), -k *(height/10)+600,0,50); //Konstruktionsregeln
      }
    }
  }
} 

class BoxClass {      // Erstellung einer Klasse und deren Daten 
  float x;  
  float y;
  float z;
  float r;
  float c;


  BoxClass(float x_, float y_, float z_, float r_, float c_) { //temporäre Daten des Konstruktors
    x = x_;
    y = y_;
    z = z_;
    r = r_;
    c = c_;
  } 
 
  void show() {      //Funktion, die im Draw nach den Konstruktionsregeln Instanzen erstellt
      noStroke();
      fill(c);
      pushMatrix();
      translate(x, y, z);
      rotate(r);
      box(50);
      popMatrix();
    } 
} 
  void mousePressed() {
  record = true;
}
