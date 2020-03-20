int total = 0;
boolean keyreleased;
int counter = 0; 
char pressedkey;
String numbers[] = new String[20];
int finalnumber;
int words = 0;

void setup() {
  size(640, 360);
  noStroke();
  background(0);
}

void draw() { 
  
  if(total == 0){
    background(0);
    rect(100,100,100,100);
  }
  else if (total > 0 && total < 20){
    background(0);
    //println("if-1");
  }
  else if (total >= 20 && total < 40){
    background(255);
    //println("if-2");
  }
  else if (total >= 40 && total < 60){
    background(255,0,0);
    //println("if-3");
  }
  else if (total >= 60 && total < 80){
    background(0,255,0);
    //println("if-4");
  }
  else if (total >= 80 && total <= 100){
    background(0,0,255);
    //println("if-5");
  }
  
  detectNumbers();

}

void keyReleased(){
  
  keyreleased = true;
  pressedkey = key;
}


void detectNumbers(){
  
  if(keyreleased == true && pressedkey != '#'){
   
    if(pressedkey == 'a'){
      
      keyreleased = false;
      println("I reset all");
    
      counter = 0;
      words = 0;
      total = 0;
      
      for(int i = 0; i <20; i++){
        numbers[i]= null;
      }
    }
    else{
      numbers[counter]= str(pressedkey);
      keyreleased = false;
      counter++;  
    }
   
  }
  
  else if(keyreleased == true && pressedkey == '#'){
     
    String joinedNumbers = join(numbers, ""); 
    String ss1 = joinedNumbers.substring(0, counter);
    
    finalnumber = Integer.parseInt(ss1);
    //println(finalnumber);
    
    keyreleased = false;
    
    for(int i = 0; i <20; i++){
      numbers[i]= null;
    }
    
    counter = 0;
    words++;
    sumNumbers();
  }
}

void sumNumbers(){
  if(words != 0){
    total = total + finalnumber;
  }
  else{
    total = 0;
  }
  
  println(total);
}
