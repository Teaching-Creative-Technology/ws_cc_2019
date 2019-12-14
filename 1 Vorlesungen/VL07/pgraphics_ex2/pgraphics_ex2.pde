// monitore oder screengröße = limitierung
// bsp. illustrator arbeiten wir auch nicht immer bei 100% zoom, sondern 66%, oder 25%. wir zoomen rein und raus

PGraphics pg;
void setup() {
  size(600, 600);
  pg = createGraphics(9933, 14043);
  pg.beginDraw();
  pg.background(255, 0, 0);
  pg.fill(255, 125, 0);
  pg.ellipse(pg.width/2, pg.height/2, 20, 20);
  pg.endDraw();
}

void draw() {
  background(0, 0, 125);
  translate(width/2, height/2);
  
  PImage pTemp = pg.get(0,0,pg.width, pg.height);
  pTemp.resize(200, 200);
  image(pTemp, 0, 0);
  
}

/*
Format  in mm  in A0  Pixel bei 300 dpi  Pixel bei 150 dpi  Pixel bei 72 dpi  Größe in qm
A0  841 x 1189  1x  9933 x 14043  4967 x 7022  2384 x 3370  0,999949
A1  594 x 841  2x  7016 x 9933  3508 x 4967  1684 x 2384  0,499554
A2  420 x 594  4x  4961 x 7016  2480 x 3508  1191 x 1684  0,24948
A3  297 x 420  8x  3508 x 4961  1754 x 2480  842 x 1191  0,12474
A4  210 x 297  16x  2480 x 3508  1240 x 1754  595 x 842  0,06237
A5  148 x 210  32x  1748 x 2480  874 x 1240  420 x 595  0,03108
A6  105 x 148  64x  1240 x 1748  620 x 874  298 x 420  0,01554
A7  74 x 105  128x  874 x 1240  437 x 620  210 x 298  0,00777
A8  52 x 74  256x  614 x 874  307 x 437  147 x 210  0,003848
A9  37 x 52  512x  437 x 614  219 x 307  105 x 147  0,001924
A10  26 x 37  1024x  307 x 437  154 x 219  74 x 105  0,000962
*/
