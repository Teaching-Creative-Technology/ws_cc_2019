movingText [] myText;  
movingText [] myText2;

void setup(){
 size(500,500,P3D);
 myText = new movingText[100];
 myText2 = new movingText[100];
 
 for(int i = 0; i < myText.length; i++){
   myText[i] = new movingText(100,550+(i*60),"ENTROPIE", color(255), 80); //call the constructor
 }
 
 for(int i = 0; i < myText.length; i++){
   myText2[i] = new movingText(200,550+(i*60),"Pah Pah Pah", color(255,0,0), 40); //call the constructor
 }
}

void draw(){
 background(0);
 
 for(int i = 0; i < myText.length; i++) {
    myText[i].drawText();
    myText[i].move_y(1);
 }
 
 for(int i = 0; i < myText.length; i++) {
   myText2[i].drawText();
   myText2[i].move_y(1);
 }
}
 
