class Ball { 
  float posX, posY, size, radius;

  Ball() {
    posX = width/2;
    posY = height/2;
    size = 10;
    radius = 1;
  }

  void step() {
    posY += 1;
  }
  
  void update() {
    if (posY > height) {
      posY = 0;
    }
  }
 

  void display() {
    fill(0);
    noStroke();
    beginShape();
    vertex(posX, posY-size);
    //top>left
    bezierVertex(posX, posY-size, posX+(size/radius), posY-(size/radius), posX+size, posY);
    
    //right>bottom
    bezierVertex(posX+size, posY, posX+(size/radius), posY+(size/radius), posX, posY+size);
    
    //bottom>left
    bezierVertex(posX, posY+size, posX-(size/radius), posY+(size/radius), posX-size, posY);
    
    //left>top
    bezierVertex(posX-size, posY, posX-(size/radius), posY-(size/radius), posX, posY-size);
    
    endShape();
  }
}
