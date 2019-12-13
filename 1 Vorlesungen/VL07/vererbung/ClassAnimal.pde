class Animal {
  PVector position;
  
  public Animal() {
    position = new PVector(random(0, width), random(0, height));
  }
  
  void makeSound() {
    println("?§!?§)§$)(F)=)(");
  }
  
  // getter
  PVector getPosition() {
    return position;
  }
  
  
  void display() {
    rect(position.x, position.y, 15, 10);
  }
  
}
