class Mover { 
  float x, y, mWidth, mHeight, playerN;
  
  Mover(int player) {
    playerN = player;
    mWidth = 50;
    mHeight = 150;
    if (playerN == 1) {
      x = 50;
    } else if (playerN == 2) {
      x = width-100;
    }
      y = height/2;
  }
  
  void moveUp() {
    y-= 10;
  }
  
  void moveDown() {
    y+= 10;
  }
  
  void display() {
    fill(255);
    noStroke();
    rect(x, y, mWidth, mHeight, 10);
  }
}
