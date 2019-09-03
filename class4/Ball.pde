class Ball {
  PVector location, velocity, gravity, propulsion;
  int size, topSpeed;
  float bounceX, bounceY, inertia;

  Ball() {
    topSpeed = -20;
    location = new PVector(width/2,height/2);
    velocity = new PVector(30,0);
    gravity = new PVector(0,0.8);
    propulsion = new PVector(0,-20);
    velocity.limit(topSpeed);
    size = 30;
    bounceX = -0.8;
    bounceY = -0.8;
  }
  
  void update() {
    velocity = velocity.add(gravity);
    location.add(velocity);
    if ((location.x > (width-(size/2))) || (location.x < 0)) {
      velocity.x = velocity.x * bounceX; 
    } if ((location.y > (height-(size/2))) || (location.y < 0)) {
      velocity.y = velocity.y * bounceY; 
    }
  }
  
  void applyForce() {
    velocity = velocity.add(propulsion);
  }
  
  void display() {
    noStroke();
    fill(0); 
    if (location.x > width-(size/2)) {
      location.x = width-(size/2);
    } if (location.y > height-(size/2)) {
      location.y = height-(size/2);
    } if (location.x < 0) {
      location.x = 0;
    } if (location.y < 0) {
      location.y = 0;
    }
    ellipse(location.x,location.y,size,size);
  }
  
}
