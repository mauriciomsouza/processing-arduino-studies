Ball b1;

void setup() {
  size(800,800);
  b1 = new Ball();
}

void draw() {
  background(255);
  b1.display();
  b1.step();
  b1.update();
}
