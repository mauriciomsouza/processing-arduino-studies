class Ball {
  PVector location, velocity, gravity, propulsion, tackleLeft, tackleRight;
  int size, topSpeed, sort;
  float bounceX, bounceY;
  
  Ball() {
    topSpeed = 5;
    sort = int(random(1,3));
    location = new PVector(width/2,height/2);
    if (sort == 2) {
      velocity = new PVector(15,0);
    } else {
      velocity = new PVector(-15,0);
    }
    gravity = new PVector(0,0.8);
    propulsion = new PVector(0,-15);
    tackleLeft = new PVector(30,-30);
    tackleRight = new PVector(-30,-30);
    size = 50;
    bounceX = -1;
    bounceY = -1;
  }
  
  void update() {
    velocity = velocity.add(gravity);
    velocity.limit(30);
    location.add(velocity);
    if ((location.y > (height-(size/2))) || (location.y < 0)) {
      velocity.y = velocity.y * bounceY; 
    }
  }
  
  void applyForce(PVector force) {
    velocity = velocity.add(force);
  }
  
  void display() {
    noStroke();
    if (location.y > height-(size/2)) {
      location.y = height-(size/2);
    }if (location.y < 0) {
      location.y = 0;
    }
    ellipseMode(CENTER);
    fill(255);
    ellipse(location.x, location.y, size, size);
  }
  
}
