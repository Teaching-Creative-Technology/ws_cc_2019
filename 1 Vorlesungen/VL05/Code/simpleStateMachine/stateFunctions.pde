void ruhezustand() {
  if(!inputEnabled) inputEnabled = true;
  fill(0);
  ellipse(width/2, height/2, 16, 16);
}

void pulsieren() {
  fill(0);
  float pulse = abs(sin(frameCount/15.0))*10.0;
  ellipse(width/2, height/2, pulse+16, pulse+16);
  
  if(millis() - timestamp > interval) state = RUHEZUSTAND;
}

void wiggle() {
  fill(0);
  PVector position = new PVector(width/2, height/2);
  position.x = random(position.x - 10, position.x + 10);
  position.y = random(position.y - 10, position.y + 10);
  ellipse(position.x, position.y, 16, 16);
  
  if(millis() - timestamp > interval) state = RUHEZUSTAND;
}
