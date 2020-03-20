class movingText { 
  float x, y; 
  String s;
  color c;
  int sz;
  
  movingText (float _x, float _y, String _text, color _colour, int _size) {  
   //This function is the 'constructor'. 
   //It will get called when you create a new
   //movingText object
    x = _x;   //Set x to the first argument
    y = _y;   //Set y to the second argument
    s = _text; //Set our string to the 3rd argument
    c = _colour;
    sz = _size;

  } 
  void drawText() { 
    //Place code to actually draw the text here.    
    // see : http://processing.org/reference/text_.html
   
    textSize(sz); 
    fill(c);
    text(s, x, y);

  } 
  
  // Now, two methods to change the x&y variables
  void move_y(float amount){
   y -= amount;
  }
  
  void move_x(float amount){
   x -= amount;
  }
}
 
