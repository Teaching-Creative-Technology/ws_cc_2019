color c1 = color(255, 0, 0);
color c2 = color(0, 255, 0);

float r2 = c1 >> 16 & 0xFF;
float g2 = c1 >> 8 & 0xFF;  // Very fast to calculate
float b2 = c1 & 0xFF;  // Very fast to calculate


println(r2);
//println(red(c1) + " / " + green(c1) + " / " + blue(c1));
//println(red(c2) + " / " + green(c2) + " / " + blue(c2));
