//sollte Port verloren gehen
/* 
import processing.serial.*;
Serial myPort;
void setup(){
String portName[] = Serial.list();
println(portName);
}
*/

import processing.serial.*;
Serial myPort;
import processing.serial.*;

String keypadNum = "";

void setup(){
  
  size(300,300);
  myPort = new Serial(this, "/dev/tty.usbmodem14101", 9600);
  myPort.bufferUntil('.');

}

void draw(){

  if(keypadNum.equals("1") == true){
    
    
    println("Fuck");
  }
}

void serialEvent(Serial port){
  keypadNum = port.readStringUntil('.');
  keypadNum = keypadNum.substring(0, keypadNum.length()-1);
  
  if(keypadNum != null){

    println(keypadNum);
    
  }
}
