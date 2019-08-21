class Ball { 
  float x, y, z;
  float tx, ty, tz, size;
  color c;

  Ball() {
    tx = random(0,50); 
    ty = random(0,50); 
    c = color(random(0,255), random(0,255), random(0,255));
    size = random(20,110);
    x = -100;
    y = -100;
  }

  void step() {
    tx += random(0.0009, 0.0012); 
    ty += random(0.0009, 0.0012); 
  }
  
  void update() {
    x = map(noise(tx), 0, 1, -500, width*1.5); 
    y = map(noise(ty), 0, 1, -500, width*1.5);
  }
 

  void display() {
    noStroke();
    fill(c);
    ellipse(x,y,size,size);
    textSize(size/4);
    fill(255);
    textAlign(CENTER, CENTER);
    text("m&m", x, y); 
  }
}
