import processing.sound.*;
import processing.serial.*;

SoundFile sounds [];
Serial myPort;
movingText [] myText1;  
movingText [] myText2;
movingText [] myText3;
movingText [] myText4;
movingText [] myText5;
movingText [] myText6;

int total = 0;
boolean keyreleased;
int counter = 0; 
String numbers[] = new String[20];
int finalnumber;
int words = 0;
String keypadNum = "";


void setup() {
  
  size(700, 500);
  noStroke();
  background(0);
  
  myPort = new Serial(this, "/dev/tty.usbmodem14101", 9600);
  myPort.bufferUntil('.');
  
  myText1 = new movingText[100];
  myText2 = new movingText[100];
  myText3 = new movingText[100];
  myText4 = new movingText[100];  
  myText5 = new movingText[100];
  myText6 = new movingText[100];
  
  sounds = loadSoundFiles("../data", new String[] {"entropie1.mp3", "Pah.mp3", "WOW.mp3", "hihaha.mp3", "Ksch.mp3", "oooh.mp3", "mhmbada.mp3"});
  
  print(sounds.length-1);
  sounds[0].loop();
  
  for(int i = 0; i < sounds.length; i++){
     sounds[i].loop();
     sounds[i].amp(0);  
  }
  
  for(int i = 0; i < myText1.length; i++){
   myText1[i] = new movingText(60,550+(i*20),"Pah Pah Pah Pah Pah Pah", color(255,185,15), 20);
   myText2[i] = new movingText(400,550+(i*30),"WOOOOOOOOOW", color(186,85,211), 30); 
   myText3[i] = new movingText(430,550+(i*60),"hihaha", color(102,205,0), 60); 
   myText4[i] = new movingText(200,550+(i*50),"kschksch", color(255,64,64), 50); 
   myText5[i] = new movingText(600,550+(i*60),"ooOOh", color(135,206,250), 60); 
   myText6[i] = new movingText(180,550+(i*20),"mhmbadamhmbadamhmbadamhmbada", color(238,169,184), 20); 
 }

}  

void draw() { 
  
  if(total == 0){
    background(0);  
    entropie();
    sounds[0].amp(1.0);
  }
  else if (total > 0 && total < 20){
    background(0);
    
    for(int i = 0; i < myText1.length; i++) {
      myText1[i].drawText();
      myText1[i].move_y(1);  }
    
    sounds[0].amp(1.0);
    sounds[1].amp(0.6);
    
    entropie();
  }
  else if (total >= 20 && total < 40){
    background(0);
  
    for(int i = 0; i < myText1.length; i++) {
      myText1[i].drawText();
      myText1[i].move_y(1);
      
      myText2[i].drawText();
      myText2[i].move_y(0.8);
      
    }
    
    sounds[0].amp(1.0);
    sounds[1].amp(0.6); 
    sounds[2].amp(0.8);
    
    entropie();
  }
  else if (total >= 40 && total < 60){
    background(0);
    
    for(int i = 0; i < myText1.length; i++) {
      myText1[i].drawText();
      myText1[i].move_y(1);
      
      myText2[i].drawText();
      myText2[i].move_y(0.8);
      
      myText3[i].drawText();
      myText3[i].move_y(1.5);

    }
    
    sounds[0].amp(1.0);
    sounds[1].amp(0.6); 
    sounds[2].amp(0.8); 
    sounds[3].amp(0.8);
    
    entropie();
  }
  else if (total >= 60 && total < 80){
    background(0);
    
    for(int i = 0; i < myText1.length; i++) {
      myText1[i].drawText();
      myText1[i].move_y(1);
      
      myText2[i].drawText();
      myText2[i].move_y(0.8);
      
      myText3[i].drawText();
      myText3[i].move_y(1.5);
      
      myText4[i].drawText();
      myText4[i].move_y(1);

    }
    
    sounds[0].amp(1.0);
    sounds[1].amp(0.6); 
    sounds[2].amp(0.8); 
    sounds[3].amp(0.8);
    sounds[4].amp(0.2);
    
    entropie();
  }
  else if (total >= 80 && total < 100){
    background(0);
    
    for(int i = 0; i < myText1.length; i++) {
      myText1[i].drawText();
      myText1[i].move_y(1);
      
      myText2[i].drawText();
      myText2[i].move_y(0.8);
      
      myText3[i].drawText();
      myText3[i].move_y(1.5);
      
      myText4[i].drawText();
      myText4[i].move_y(1);
      
      myText5[i].drawText();
      myText5[i].move_y(1.7);

    }
    
    sounds[0].amp(1.0);
    sounds[1].amp(0.6); 
    sounds[2].amp(0.8); 
    sounds[3].amp(0.8);
    sounds[4].amp(0.2);
    sounds[5].amp(0.8);
    
    entropie();
  }
 else if (total >= 100 && total <= 120){
    background(0);
    
    for(int i = 0; i < myText1.length; i++) {
      myText1[i].drawText();
      myText1[i].move_y(1);
      
      myText2[i].drawText();
      myText2[i].move_y(0.8);
      
      myText3[i].drawText();
      myText3[i].move_y(1.5);
      
      myText4[i].drawText();
      myText4[i].move_y(1);
      
      myText5[i].drawText();
      myText5[i].move_y(1.7);
      
      myText6[i].drawText();
      myText6[i].move_y(3);
    }
    
    sounds[0].amp(1.0);
    sounds[1].amp(0.6); 
    sounds[2].amp(0.8); 
    sounds[3].amp(0.8);
    sounds[4].amp(0.2);
    sounds[5].amp(0.8);
    sounds[6].amp(1.0);
    
    entropie();
  }
  
  detectNumbers();

}

void serialEvent(Serial port){
  
  keyreleased = true;
  
  //println("Serial Event is true");
  
  keypadNum = port.readStringUntil('.');
  keypadNum = keypadNum.substring(0, keypadNum.length()-1);
  
}

void detectNumbers(){
  
  if(keyreleased == true && keypadNum.equals("#") == false){
    
    if(keypadNum.equals("*") == true){
      
      keyreleased = false;
      println("I reset all");
    
      counter = 0;
      words = 0;
      total = 0;
      
      for(int i = 0; i < numbers.length; i++){
        numbers[i]= null;
      }
      
      for(int i = 1; i < sounds.length; i++){
       sounds[i].amp(0); 
      }
    }
    else{
      numbers[counter]= keypadNum;
      keyreleased = false;
      counter++;  
    }
   
  }
  
  else if(keyreleased == true && keypadNum.equals("#") == true){
     
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

SoundFile[] loadSoundFiles(String path, String[] fileList) {
  SoundFile[] soundFile = new SoundFile[fileList.length]; // initialize the array
  for (int i=0; i<fileList.length; i++) {
    soundFile[i] = new SoundFile (this, path + "/" + fileList[i]);
  }
  return soundFile;
}

void entropie(){
   fill(255);
   textSize(120);
   textAlign(CENTER);
   text("ENTROPIE", width/2, height/2);
}
