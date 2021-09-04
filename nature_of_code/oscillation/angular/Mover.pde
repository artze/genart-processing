class Mover {
  PVector location, velocity, acceleration;
  float mass, angle, aVelocity, aAcceleration;
  Mover() {
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 20;

    angle = 0;
    aVelocity = 0;
    aAcceleration = 0;
  }

  void checkEdges() {
    if (location.x < 0) {
      location.x = width;
    } else if (location.x > width) {
      location.x = 0;
    }
    if (location.y < 0) {
      location.y = height;
    } else if (location.y > height) {
      location.y = 0;
    }
  }

  void update() {
    acceleration.add(new PVector(random(-0.05, 0.05), random(-0.05, 0.05)));
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    aAcceleration = velocity.x / 100;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, -2, 2);
    angle += aVelocity;

    checkEdges();
  }

  void draw() {
    fill(175);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rect(0, 0, mass * 2, mass * 2);
    popMatrix();
  }
}