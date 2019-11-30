/*
  Wir können dank der Hilfe von ArrayListen nun soviele Autos hinzufügen wie wir wollen.
  Wenn wir eine Taste drücken, entfernen wir auch wieder Autos.
  
  Sollten wir eventuell soviele Autos entfernt haben, dass unsere ArrayListe leer ist,
  so stoppen wir unseren Code vor dem entfernen von "nicht existenten" Autos.
  
  Ohne diesen Stopp, würden wir sonst einen ungültigen Speicherzugriff erzeugen: IndexOutOfBoundsException
  Einer der häufigsten Fehler oder auch "Exception". Dieser Fehler tritt auf, wenn wir mit Arrays oder ArrayListen
  arbeiten und versuchen auf Speicherbereiche zuzugreifen die nicht existent sind oder nie zugewiesen wurden.
  
*/
int value = 0;
int anzahlAutos = 5;
ArrayList<Auto> auto = new ArrayList<Auto>();

void setup() { // einmal
  size(600, 600);
  println(value);
  
  for(int i = 0; i<anzahlAutos; i++) {
    auto.add( new Auto( (int)random(height/2 - 100, height/2 + 100) ) );
  }
}

void draw() { // unendlich
  background(255);
  
  for(int i = 0; i<auto.size(); i++) {
    auto.get(i).update();
    auto.get(i).display();
  }
  
}

void mousePressed() {
  auto.add(new Auto ( mouseY ) );
}

void keyPressed() {
  // auto.remove( auto.size() - 1);
  //if(auto.size() > 0)
  auto.remove( (int)random(auto.size() ));
}
