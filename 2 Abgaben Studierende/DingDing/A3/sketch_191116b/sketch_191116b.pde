//import java.util.Iterator;

System systems;
//Drawrect drawrects;

//float[] rotation = new float[3];
//float[] avelocity = new float[3];

//PVector position ;
  //PVector position1;


void setup() {
  fullScreen();
  background(255);
  noFill();
  rectMode(RADIUS);
  //drawrects = new Drawrect(position);
    systems = new System(210);
  
 // float rotation = random (0,360);
 // float avelocity = random(-2,5);
 
 // parts1 =  new Part(x,y,rotation,avelocity);
  
  //parts2 =  new Part(x+100,y,rotation,avelocity);
  
}

void draw() {
  background(255);
  //system.generate();
  //drawrects.generate();
  //drawrects.update();
  systems.generate();
}
  
class System{
  Part[][] parts = new Part[8][5];
  float s;
  
  System(float s_){
    
    float x = 100;
    float y = 100;
    s = s_;
  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 5; j++) {
      parts[i][j] = new Part(x+s*i,y+s*j,random (0,360),random(-2,5));
  }
}
  
    
  }
  
  void generate(){
    
    for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 5; j++) {
      // Oscillate and display each object
      parts[i][j].show();
      parts[i][j].update();
      }
    }  
  
  }
  
  
}
  
  



  
  
  

class Part{
  //PVector position, velocity;
  float rotation,avelocity,x,y;
  int num;
  Drawrect[] drawrects ;
  
  
  Part(float x_,float y_, float rota_,float avel_){
    //position = pos_;
    //velocity = vel_;
    x = x_;
    y = y_;
    rotation = rota_;
    avelocity = avel_;
    
    num = int(random(3,7));
    
    drawrects = new Drawrect[num];
    
    for(int i=0;i<num;i++){
       drawrects[i] = new Drawrect();
     }   
  
  }
  
   void show(){
    pushMatrix();
    translate(x,y);
    rotate(radians(rotation));
    for(Drawrect d : drawrects){
      //i=new Branch(this.radius,this.ratio,this.rotation);
      d.generate();
      d.update();
    }
    popMatrix();
}
   void update(){
    //position.add(velocity);
    rotation += avelocity;
  }
}



class Drawrect{
    PVector position;
    
    float posX ;
    float posY ;
    float stepX ;
    float stepY ;
    float stepx ;
    float stepy ;
    
    
    float strokeW;
    
  
    int color1 ;
    int color2 ;
    int color3 ;
 
    int[] colorarr = new int[3] ;
    int test ;
    
    
  Drawrect(){
    posX = random(-5,5);
    posY = random(-5,5);
    stepX = random(50,150);//mouse change?
    stepY = random(50,150);
    stepx = stepX;
    stepy = stepY;
    
    /* (float posX_,float posY_,float stepX_,float stepY_)
    posX = posX_;
    posY = posY_;
    stepX = stepX_;
    stepY = stepY_;
    */
    
    
    strokeW=random(1,6);//mouse change
  
    colorarr[1] = color(134,128,166,200);
    colorarr[2] = color(241,201,201,200);
    colorarr[0] = color(161,209,231,200);
 
    test = int(random(0,3));
    
  
  }

  void generate(){
    rectMode(RADIUS);
    noFill();
    stroke(colorarr[test]);
    strokeWeight(strokeW);
    pushMatrix();
    //translate(position.x,position.y);
    //rotate(radians(rotation));
    rect(posX,posY,stepx,stepy);  
    popMatrix();
  }
  
  void update(){
   
      stepx =stepX*map(mouseX,0,width,0.1,5);
    

      stepy=stepY*map(mouseY,0,height,0.1,5);
    
   }
 }
 
