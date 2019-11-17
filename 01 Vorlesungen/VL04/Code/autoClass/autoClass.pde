/*
  Dieses beispiel zeigt, wie wir eine Klasse Auto in einem neuen Tab
  ablegen um unseren Code zu pflegen.
  Es wird auch demonstriert, wie "sichtbar" Tabs sind indem wir in einem Tab "Global"
  eine Variable ablegen und aurufen.
  
  
*/

int value = 0;
Auto[] auto = new Auto[3];

void setup() { // ausführung: einmal
  size(600, 600);
  println(value);
  
  for(int i = 0; i<3; i++) {
    auto[i] = new Auto();
  }
}

void draw() { // ausführung: unendlich
  background(255);
  
  for(int i = 0; i<3; i++) {
    auto[i].update();
    auto[i].display();
  }

}
