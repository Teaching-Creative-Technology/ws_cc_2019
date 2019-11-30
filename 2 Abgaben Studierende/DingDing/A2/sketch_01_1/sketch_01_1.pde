int step = 50; // Rastergröße
int x = 0; // aktueller X Wert
int y = 0; // aktueller Y Wert

void setup() {
  fullScreen();
  background(255);
  noFill();
}

void draw() {

float n = random(1, 6);
  // in 50% der Fällen
  if (n > 2.5) {
    // Backwards Slash
    drawrect(x, y, step ,step,n);
    //rect(x-5,y-5,step-5,step-5);
  } else { // in den anderen 50% der Fälle
    drawrect(x+10 ,y+10, step-10,step-10,n);
    //rect(x-10,y-0,step-2,step-8);
  }

  // nächster Punkt auf der X-Achse im Raster
  x = x + step;

  // wenn x am Ende der Zeile/X-Achse der Zeichenfläche ankommt
  if (x >= width) {
    x = 0; // x wieder ganz nach links setzten
    y = y + step; // Zeilenumbruch
  }

} 

void drawrect(float a,float b, float stepa,float stepb,float level) {                    
  float a1=random(8);
  float b1= random(8);
  float s =random(8);
  float s1 =random(8);
  
  int color1 = color(134,128,166,200);
  int color2 = color(241,201,201,200);
  int color3 = color(161,209,231,200);
 
  int[] colorarr = {color1,color2,color3};
  int test = int(random(1,3));
  //println(colorarr[test]);
  
  stroke(colorarr[test]);
  strokeWeight(random(2,6));
  rect(a + a1,b + b1, stepa - a1- s,stepb-b1-s);      
  if(level > 1) {
    level = level - 1;
    drawrect(a + a1, b + b1,stepa-a1-s,stepb-b1-s, level);
  }
  }
  
  void keyPressed() {
  if (key == 's' || key == 'S') save("myCanvas1.1.png");
    if (key == DELETE||key == BACKSPACE) {
      x = 0;
      y = 0;
      background(255);
  }
}
