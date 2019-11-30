//2019, Marie Steinbrügge, Aufgabe 01

//Festlegung wichtiger Variabeln
int columns;
int rows; 

int scl = 100;
int w = 660;
int h = 480;

float lineX;
float lineY;

int radius = (scl/2)/2;

float angleConverted; 
float angleAnimation;
float randomAngle;

// Array-Liste für zufällige Winkel 
float [][] angles;

int i;
int test;
float a;

int r = 255;
int g = 255;
int b = 255;

int time = 100;
int timer;
int timerSnap = 15*30;
int nummer = 0;

void randomAngles(){
  for (int x = 0; x < w/10; x++){
    for (int y = 0; y < h/10; y++){
      angles [x][y] = (int) random(0,360);
    }
  }
}

void setup(){
  size(700,520);
  frameRate(60); 
  background (80,80,80);
  
  rows = h/scl;
  columns = w/scl;
  
  timer = time;
  
  angles = new float [w/10][h/10];
  randomAngles();
}


int timer(){
   timer--;
   return timer;
}


void draw (){
    
  randomAngle = radians(i);
  
  for (int x = scl; x <= w; x += scl){
    for (int y = scl; y <= h; y += scl){
      
      angleAnimation = angles [x/10][y/10] + (cos(randomAngle))*100 + a;
      angleConverted = radians(angleAnimation);
      
      lineX = x + (radius * cos(angleConverted));
      lineY = y + (radius * sin(angleConverted));
      
      stroke(r,g,b,10);
      
      line(x,y, lineX, lineY);

    }
  }
  
  angleAnimation += cos(randomAngle) + a;
  i++;
  
  if(timer() == 1){
     timer = time;
     a = random(0, 360);
     r = (int)random(0, 255);
     g = (int)random(0, 255);
     b = (int)random(0, 255);
   }
   
   if (timerSnap == 0) {
    timerSnap = 15*30;
    println("SNAP");
    save("test" + nummer + ".jpg"); 
    nummer++;
  } else {
    timerSnap--;
  }
   
} 
