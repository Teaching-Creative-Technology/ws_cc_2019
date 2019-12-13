Animal a;
Dog d;

Animal[] animals = new Animal[2];

void setup() {
  size(500, 500);
  a = new Animal();
  d = new Dog();
  
  animals[0] = a;
  animals[1] = d;
  
  /*a.makeSound();
  a.display();
  println(a.getPosition());
  
  d.makeSound();
  d.display();
  println(d.getPosition());
  */
  for(int i = 0; i<animals.length; i++) {
    animals[i].makeSound();
  }
  
  
}

void draw() {
}
