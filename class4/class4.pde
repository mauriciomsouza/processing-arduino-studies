Ball b = new Ball();
PImage img;

void setup() {
  size(800,800);
  background(255); 
  img = loadImage("ball.png");
}

void draw() { 
  background(255);
  b.update();
  b.display();
  
}

void mousePressed() {
  b.applyForce();
}
