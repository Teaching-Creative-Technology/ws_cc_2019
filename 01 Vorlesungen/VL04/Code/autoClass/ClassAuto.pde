class Auto {
  protected int posX;
  protected int posY;
  protected int speed;

  public Auto() {
     posX = 100; // 100.0
     posY = (int)random(height/2 - 100, height/2 + 100);
     speed = (int)random(1, 5);
  }
  
  void update(){
    posX += speed;
    //posY += random(10);
    speed = (int)random(1, 5);
    checkForEdges();
  }
  
  void display(){
    fill(0);
    rect(posX, posY, 30, 15);
  }
  
  private void checkForEdges() {
    if(posX > width) {
      posX = -30;
    }
    
    if(posY > height) {
      posY = -15;
    }
  }
  
  /*
    Signature einer Methode
    
    Rückgabewert nameDerFunktion(Parameterliste … ) {
    }
    
    – Sofern wir als Rückgabewert in der Signatur einen Datentypen angeben, brauchen wir das
    Keyword "return" mit einer Variable oder Berechnung von diesem Datentypen
    – Das keyword "void" in der Signatur befreit uns davon.
  */
  void setX(int _x) {
    posX = _x;
  }
  
  void setY(int _y) {
    posY = _y;
  }
  
  int getX() {
    return posX;
  }

  
  
  

}
