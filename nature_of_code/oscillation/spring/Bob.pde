class Bob {
  PVector location, velocity, acceleration;
  float mass;

  Bob(PVector location_) {
    location = location_;
    velocity = new PVector();
    acceleration = new PVector();
    mass = 10;
  }

  void applyForce(PVector f) {
    PVector fCopy = PVector.div(f, mass);
    acceleration.add(fCopy);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);
  }

  void draw() {
    circle(location.x, location.y, 8);
  }
}