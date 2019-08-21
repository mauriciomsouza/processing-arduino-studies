int posX, posY, signal;
float circleSize, velocity;

void setup() {
  size(1200,800);
  posX = width/2;
  posY = height/2;
  circleSize = 0;
  signal = 0;
  background(255);
}

void draw() {
  posX = mouseX;
  posY = mouseY;
  changeSize(signal);
  stroke(random(0,255), random(0,255), random(0,255));
  noFill();
  ellipse(posX, posY, circleSize, circleSize);
  if (circleSize > random(100,300) && signal == 0) {
    signal = 1;
  } else if (circleSize < 0 && signal == 1) {
    signal = 2;
  } else if (circleSize > random(100,300) && signal == 2) {
    signal = 0;
  }
}

void changeSize(int tempSignal) {
  if (tempSignal == 0) {
    circleSize += random(10,30);
    strokeWeight(random(1,4));
  } else if (tempSignal == 1) {
    circleSize -= random(10,30);
    strokeWeight(random(1,4));
  } else if (tempSignal == 2) {
    circleSize += random(10,30);
    strokeWeight(random(1,4));
  }
  
}
