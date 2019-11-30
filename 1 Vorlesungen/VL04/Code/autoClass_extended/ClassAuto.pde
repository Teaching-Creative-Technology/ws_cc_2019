class Auto {
  protected int posX;
  protected int posY;
  protected int speed;

  public Auto(int _y) {
     posX = 100;
     posY = _y;
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
