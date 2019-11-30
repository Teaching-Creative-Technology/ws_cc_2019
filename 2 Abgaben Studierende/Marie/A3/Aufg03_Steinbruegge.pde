// Aufg 03, Marie Steinbrügge, 28.11.2019
// basierend auf Code-Idee von Daniel Shiffman (https://processing.org/examples/noisewave.html)

ArrayList<LineAnimation> allObjects = new ArrayList<LineAnimation>();

void setup(){
  size(600,600);
  smooth ();
  frameRate(30);
  
}

void mouseClicked() {
  allObjects.add(new LineAnimation(mouseX,mouseY, 50, 1000, color(random(0,255),random(0,255),random(0,255), 95)));
}

void draw(){
  
  fill (76, 5);
  noStroke ();
  rect (0, 0, width, height);

  for(int i = 0; i < allObjects.size(); i++){
    allObjects.get(i).draw();
  }
}


class Point {
  
  public float xPosition;
  public float yPosition;
  color colour;
  
  Point(float xPos, float yPos, color colour){
    this.xPosition = xPos;
    this.yPosition = yPos;
    this.colour = colour;
  }
  
  public void draw(){
    vertex(this.xPosition,this.yPosition);
  }
  
}


class LineAnimation {
  
  ArrayList<Point> points;
  
  float xPosition;
  float yPosition;
  float size;
  float step;
  
  public color colour;

  LineAnimation(float xPos, float yPos, float size, float pointNumber, color colour){
    this.xPosition = xPos;
    this.yPosition = yPos;
    this.size = size;
    this.step = random(0,100);
    
    this.colour = colour;
    
    points = new ArrayList<Point>();

      for (float a = 0; a < TWO_PI; a+= TWO_PI/pointNumber){
    
        float xoff = map(cos(a+this.step), -1,1,0,4);
        float yoff = map(sin(a), -1,1,0,4);
        
        float r = map(noise(xoff,yoff), 0, 1, 70, 170);
        float x = r*cos(a)+this.xPosition;
        float y = r*sin(a)+this.yPosition;
        
        points.add(new Point(x, y, colour));
      }
    }
    
    public void update(){
      for(int i = 0; i < points.size(); i++){
        float a = map(i, 0, points.size(), 0, TWO_PI);
        
        float xoff = map(cos(a+this.step), -1,1,0,4);
        float yoff = map(sin(a), -1,1,0,4);
        
        float r = map(noise(xoff,yoff), 0, 1, 70, 170);
        float x = r*cos(a)+this.xPosition;
        float y = r*sin(a)+this.yPosition;
        
        points.get(i).xPosition = x;
        points.get(i).yPosition = y;
      }
    }
    
    public void draw(){
      
      stroke(this.colour);
      strokeWeight(0.2);
      noFill();
      
      this.update();
      
      beginShape();
        for(int a = 0; a < points.size(); a++){
          points.get(a).draw();
        }
      endShape(CLOSE);
      
      this.step += 0.01;
    }
}
