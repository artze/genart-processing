class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, -10);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector f) {
    PVector fCopy = PVector.div(f, mass);
    acceleration.add(fCopy);
  };

  void checkEdges() {
    if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    } else if (location.x > width) {
      velocity.x *= -1;
      location.x = width;
    }

    if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    } else if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }

  void draw() {
    stroke(255);
    strokeWeight(mass);
    point(location.x, location.y);
  }
}
