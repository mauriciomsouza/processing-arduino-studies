Ball b = new Ball();

void setup() {
  size(700,700);
  background(255); 
}

void draw() { 
  background(255);
  b.update();
  b.display();
  
}

void mousePressed() {
  b.applyForce();
}
