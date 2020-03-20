class movingText { 
  float x, y; 
  String s;
  color c;
  int sz;
  
  movingText (float _x, float _y, String _text, color _colour, int _size) {  
    x = _x;   
    y = _y;   
    s = _text; 
    c = _colour;
    sz = _size;

  } 
  void drawText() { 
   
    textSize(sz); 
    fill(c);
    text(s, x, y);

  } 
  
  void newColour(color farbe){
    c = farbe;
  }
 
  void move_y(float amount){
   y -= amount;
  }
  
  void move_x(float amount){
   x -= amount;
  }
}
 
