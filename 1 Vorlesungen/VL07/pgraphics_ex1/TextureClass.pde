class Texture {
  PGraphics pg;
  PImage p;
  float positionY = 0;
  
  Texture() {
    p = loadImage("texture.jpg");
    pg = createGraphics(500, 500);
  }
  
  void update() {
    positionY -= 1;
    pg.beginDraw();
    pg.image(p, 0, positionY);
    pg.image(p, 0, pg.height+positionY);
    pg.endDraw();
    
    if(positionY < -500) positionY = 0;
    
    // debug
    // println(positionY);
  }
  
  void display() {
    image(pg, 0, 0);
  }
  
  PGraphics getDisplay() {
    return pg;
  }
  
}
