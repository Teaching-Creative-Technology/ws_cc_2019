class Dog extends Animal {
  
  Dog() {
    
    //position = new PVector(10, 10);
  }
  
  void makeSound() {
    println("woof");
  }
  
  void display() {
    ellipse(position.x, position.y, 30, 30);
  }
}
