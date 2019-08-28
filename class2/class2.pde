
ArrayList<Ball> movers = new ArrayList<Ball>();

void setup() {
 size(1200,1200); 
 background(255,255,255);
 
}

void draw() {
  fill(255,255,255, 60);
  rect(0, 0, width, height);
  for (Ball balls : movers){
    balls.display();
    balls.step(); 
    balls.update();
  }
}

void addBall() {
  movers.add(new Ball());
}

void mousePressed() {
  addBall();
}
