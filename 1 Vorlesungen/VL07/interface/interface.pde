Hyazinth h;

void setup() {
  h = new Hyazinth();
  h.grow();
}

void draw() {
}

// Unser Interface ist ein Versprechen bestimmte Methoden umzusetzen
// Es dient quasi als Blaupause für Klassen, die bestimmte Funktionalitäten anbieten sollen
// Vielmehr ist dies wichtig, wenn wir Schnittstellen zwischen verschiedenen Programmen
// haben wollen aber nicht wissen was oder wie die Gegenseite den Programmieranteil
// im Detail umsetzen wird.
interface Eingabe {
  float feuchtigkeit = 0;
  color farbe = 0;
  int anzahlBlatter = 0;
  float groesse = 0;
  
  void grow();
  
}

class Hyazinth implements Eingabe {
  
  Hyazinth() {
  }
  
  void grow() {
    groesse++;
  }
} 
