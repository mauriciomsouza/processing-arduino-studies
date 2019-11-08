boolean checkCollision(Mover mover) {
  float testX = b.location.x;
  float testY = b.location.y;
  
  if(b.location.x < mover.x) {
    testX = mover.x;
  } else if (b.location.x > mover.x+mover.mWidth) {
    testX = mover.x + mover.mWidth;
  }
  
  if(b.location.y < mover.y) {
    testY = mover.y;
  } else if (b.location.y > mover.y+mover.mHeight) {
    testY = mover.y + mover.mHeight;
  }
  
  float distX = b.location.x-testX;
  float distY = b.location.y-testY;
  float distance = sqrt((distX*distX)+(distY*distY));
  
  line(distX, distY, testX, testY);
  
  if (distance <= (b.size/2)) {
    return true;
  } else {
    return false;
  }
}
