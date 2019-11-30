/*
  Wir haben unsere Auto Klasse erweitert:
  Der Konstruktor von Auto kann nun einen Paramater empfangen und
  durch Klicken auf dem Bildschirm können wir nun das 3. Auto in der y-Achse "neu" setzen
*/

int value = 0;
int anzahlAutos = 5;
Auto[] auto = new Auto[anzahlAutos];

void setup() {
  size(600, 600);
  println(value);
  
  for(int i = 0; i<auto.length; i++) {
    auto[i] = new Auto( (int)random(height/2 - 100, height/2 + 100) );
  }
}

void draw() {
  background(255);
  
  for(int i = 0; i<auto.length; i++) {
    auto[i].update();
    auto[i].display();
  }
  
}

void mousePressed() {
  auto[3] = new Auto( mouseY );
}
