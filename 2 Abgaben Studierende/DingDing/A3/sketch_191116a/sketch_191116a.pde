import java.util.Iterator;

System systems;
//Drawrect drawrects;
//Part parts;
boolean state;


void setup() {
  fullScreen();
  background(255);
  noFill();
  rectMode(RADIUS);
  //drawrects = new Drawrect(position);
  systems = new System(0.3);
  
}

void draw() {
  background(255);
  //systems.generate();
  //drawrects.generate();
  //drawrects.update();
  //parts.show();
  //parts.update();
  
  if (mousePressed == true){
   systems.emit();
  }else{
     
     textSize(100);
     fill(0, 102, 153);
     text("Press Mouse", width/2-300, height/2);
     
        
  }
   
   systems.update();
  
}

class System{
  float speed;
  ArrayList<Part> parts;
  
  System(float speed_){
    speed = speed_;
    parts = new ArrayList<Part>();
      
  }
  
   void emit(){
  
    if(random(1)<speed){
    generate();
    }  
   
   }
  
  void generate(){
    PVector position = new PVector(mouseX,mouseY);
    PVector velocity = new PVector(random(-5,5),random(-5,5));
    float rotation = random (0,360);
    float avelocity = random(-2,5);
    
    Part p = new Part(position,velocity,rotation,avelocity);
    parts.add(p);
    
  }
   void update(){
    Iterator<Part> it = parts.iterator();
    while(it.hasNext()){
      Part p = it.next();
      //s.applyForce();
      p.update();
      p.show();
      if(p.position.y > height||
         p.position.y < 0||
         p.position.x > width||
         p.position.x < 0){
        it.remove();
      }
    }
    
  }   
  
}


class Part{
  PVector position, velocity;
  float rotation,avelocity;
  int num;
  Drawrect[] drawrects ;
  
  
  Part(PVector pos_, PVector vel_,float rota_,float avel_){
    position = pos_;
    velocity = vel_;
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
    translate(position.x,position.y);
    rotate(radians(rotation));
    for(Drawrect d : drawrects){
      //i=new Branch(this.radius,this.ratio,this.rotation);
      d.generate();
      d.update();
    }
    popMatrix();
}
   void update(){
    position.add(velocity);
    rotation += avelocity;
  }
}

class Drawrect{
    PVector position;
    
    float posX ;
    float posY ;
    float stepX ;
    float stepY ;
    
    
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
    rect(posX,posY,stepX,stepY);  
    popMatrix();
  }
  
  void update(){
    if(stepX>0){
      stepX--;
    }
    if(stepY>0){
      stepY--;
    }
   }
  }
 
