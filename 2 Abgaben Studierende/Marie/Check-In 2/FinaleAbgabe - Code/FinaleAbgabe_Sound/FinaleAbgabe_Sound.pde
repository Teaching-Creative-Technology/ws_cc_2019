import processing.sound.*;
SoundFile sounds [];
 
void setup() {
  size(640, 360);
  background(255);
  
  sounds = loadSoundFiles("../data", new String[] {"entropie.mp3", "Pah.mp3", "WOW.mp3", "hihaha.mp3", "Ksch.mp3", "oooh.mp3", "mhmbada.mp3"});
  
  print(sounds.length-1);
  sounds[0].loop();
  
  for(int i = 1; i < sounds.length; i++){
     sounds[i].loop();
     sounds[i].amp(0);  
  }

}      
 
void draw() {
  
  if(key == 'a'){
    println('a');
    sounds[1].amp(0.8); 
  }
  else if(key == 'b'){
    println('c');
    sounds[1].amp(0.4); 
    sounds[2].amp(0.8); 
  }
  else if(key == 'c'){
    println('c');
    sounds[1].amp(0.2); 
    sounds[2].amp(0.4); 
    sounds[3].amp(0.8);
  }
  else if(key == 'd'){
    println('c');
    sounds[1].amp(0.2); 
    sounds[2].amp(0.4); 
    sounds[3].amp(0.4);
    sounds[4].amp(0.8);
  }
  else if(key == 'e'){
    println('c');
    sounds[1].amp(0.2); 
    sounds[2].amp(0.2); 
    sounds[3].amp(0.4);
    sounds[4].amp(0.4);
    sounds[5].amp(0.8);
  }
 
}

SoundFile[] loadSoundFiles(String path, String[] fileList) {
  SoundFile[] soundFile = new SoundFile[fileList.length]; // initialize the array
  for (int i=0; i<fileList.length; i++) {
    soundFile[i] = new SoundFile (this, path + "/" + fileList[i]);
  }
  return soundFile;
}
