// measurements of the boxes
int widthX = 10;
int widthY = 10;
int widthZ = 10;

// values for rotation of boxes
float rotationX = 2.5;
float rotationY = 2.5;

// timer
int timer = 4;

// countdown
boolean counter = true;

// picturenumber
int picturenumber = 0;

void setup(){
  size(800,800,P3D);
  lights();
  frameRate(3); 
}

void picture(){
  if (keyPressed) {
      if (key == 's' || key == 'S') {
        save("Picture_" + picturenumber + ".jpg");
        picturenumber++;
      }
    }
}

// function to draw expanding figures
void positive(){
  for (int i=0; i <= 6; i++) { 
    box(widthX, widthY, widthZ);
    widthX=widthX + 10;
    widthY=widthY + 10;
    widthZ=widthZ + 10;
    rotationX=rotationX + 2.5;
    rotationY=rotationY + 2.5;
    rotateX(rotationX);
    rotateY(rotationY);

  } 
}

// function to draw decreasing figures
void negative(){
  for (int i=0; i <= 6; i++) { 
    box(widthX, widthY, widthZ);
    widthX=widthX - 10;
    widthY=widthY - 10;
    widthZ=widthZ - 10;
    rotationX=rotationX - 2.5;
    rotationY=rotationY - 2.5;
    rotateX(rotationX);
    rotateY(rotationY);

  } 
}

void draw(){
  background(0);
  translate(400, 400, 0); 
  noFill();
  stroke(255);

 

  // set counter 
  if (timer == 0){
    counter = false;
  }
  
  // countdown, draw expanding figures
  else if(timer != 0 && counter == true){
    timer--;
    positive(); 
 
  }
  
  // countdown, draw decreasing figures
  if (counter == false && timer != 4){
    negative();
    timer++;
 
  }
  
  // reset timer
  else if(timer == 4){
    counter = true;
  }
  picture();

  }
