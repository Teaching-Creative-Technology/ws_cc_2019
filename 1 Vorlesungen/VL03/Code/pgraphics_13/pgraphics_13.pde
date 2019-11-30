PGraphics pg;

void setup() {
  size(600, 600);
  pg = createGraphics(200, 200);
  
  pg.beginDraw();
  pg.ellipseMode(CORNER);
  pg.noFill();
  pg.strokeWeight(4);
  pg.circle(4,4, 50); // korrektur für strokeWeight
  pg.line(0,0, 58, 58); // und hier
  pg.endDraw();
  
  //imageMode(CENTER);
}

void draw() {
  background(255);
  image(pg, width/2 + 150, height/2);
  image(pg, width/2 - 150, height/2);
}
