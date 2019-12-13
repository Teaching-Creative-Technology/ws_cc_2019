Texture tex;

int[] xPositions = {75, 225, 375, 525};
int[] yPositions = {100, 300, 500};
int[] rotations = {
                    0, 90, 180, 270,
                    0, 180, 90, 90,
                    180, 0, 270, 0
                  };
                  
PVector randomStart;
PVector randomEnd;


void setup() {
  size(1200, 800);
  tex = new Texture();
  imageMode(CENTER);
  
  randomStart = new PVector(0, 0);
  randomEnd = new PVector(120, 120);
}

void draw() {
  background(50);
  // berechnung; grafik verschiebung, "seamless texture"
  tex.update();
  
  // normale methode
  //tex.display();
  
  // returnt ein PGraphics objekt
  //image(tex.getDisplay().get(0, 0, 150, 250), 0, 0);
  //translate(300, 100);
  // coole strategie
  
  for(int x = 0; x< xPositions.length; x++) {
    for(int y = 0; y< yPositions.length; y++) {
      pushMatrix();
      translate(xPositions[x], yPositions[y]);
      rotate(radians(rotations[x+4*y])); // trick! x*y = unsere id, ABER 0*0 = 0
      image(tex.getDisplay().get(0, 0, 120, 120), 0, 0);
      //image(tex.getDisplay().get(0, 0, 60, 60), 0, 0, 120, 120);
      //image(tex.getDisplay().get((int)randomStart.x, (int)randomStart.y, 120, 120), 0, 0);
      //image(tex.getDisplay().get((int)randomStart.x, (int)randomStart.y, (int)randomEnd.x, (int)randomEnd.y), 0, 0, 120, 120);

      popMatrix();
    }
  }
  
  
  
  
  
}

void mousePressed() {
    PImage tempImage = tex.getDisplay();
    randomStart = new PVector(random(0, tempImage.width), random(0, tempImage.height));
    randomEnd = new PVector(random(0, tempImage.width), random(0, tempImage.height));
  }
