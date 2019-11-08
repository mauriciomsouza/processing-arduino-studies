PFont bitfont;
int color1, color2, color3;
Mover p1, p2;
PImage logo;
int screen;
int s;
Ball b = new Ball();
boolean p1Up = false;
boolean p1Down = false;
boolean p2Up = false;
boolean p2Down = false;

void setup() {
  size(1280,720);
  background(255); 
  p1 = new Mover(1);
  p2 = new Mover(2);
  logo = loadImage("logo.png");
  bitfont = loadFont("8-bit-pusab-16.vlw");
  screen = 0;
}

void draw() { 
  s = second();
  if (screen == 0) {
    screen0();
  } else if (screen == 1) {
    screen1();
  }
}

void keyPressed() {
  if (key == 'Q' || key == 'q') {
    p1Up = true;
  }
  else if (key == 'Z' || key == 'z') {
    p1Down = true;
  }
  else if (key == 'O' || key == 'o') {
    p2Up = true;
  }
  else if (key == 'M' || key == 'm') {
    p2Down = true;
  }
}

void keyReleased() {
  if (key == 'Q' || key == 'q') {
    p1Up = false;
  }
  else if (key == 'Z' || key == 'z') {
    p1Down = false;
  }
  else if (key == 'O' || key == 'o') {
    p2Up = false;
  }
  else if (key == 'M' || key == 'm') {
    p2Down = false;
  }
}
