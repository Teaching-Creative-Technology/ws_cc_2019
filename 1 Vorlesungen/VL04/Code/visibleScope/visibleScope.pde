/*
  In diesem Sketch sehen wir, dass eine lokal
  deklarierte Variable ( Ergebnis in der Funktion addition() )
  keinen Einfluss auf die Variable ergebnis in unserer
  main-loop hat.
  */

int ergebnis = 123;

void setup() {
  size(600, 600);
  println(ergebnis);
}

void draw() {
  int ergebnis = 2000;
  println(ergebnis);
  int anderesErgebnis = addition(1, 1);
  println(ergebnis);
  println(anderesErgebnis);
  fill(0);
  text(ergebnis, width/2, height/2 - 20);
}

int addition(int a, int b) {
  int ergebnis = 1000;
  //int c = a + b;
  return ergebnis;
}
