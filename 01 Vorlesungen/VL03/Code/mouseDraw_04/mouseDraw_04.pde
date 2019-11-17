int[] y;

void setup() {
  size(400, 400);
  y = new int[width];
  strokeWeight(2);
}

void draw() {
  background(0);
  for (int i = y.length-1; i > 0; i--) {
    y[i] = y[i-1];
  }
  
  y[0] = mouseY;
  stroke(255);
  for (int i = 1; i < y.length; i++) {
    line(i, y[i], i-1, y[i-1]);
  }
}
