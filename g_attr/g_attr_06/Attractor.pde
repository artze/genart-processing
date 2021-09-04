class Attractor {
  PVector location, velocity, acceleration;
  float mass;
  float xoff;

  Attractor(PVector location_) {
    location = location_;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 300;
  }

  PVector getAttractiveForce(Mover m) {
    PVector attractorToMover = PVector.sub(location, m.location);
    float distance = attractorToMover.mag();
    distance = constrain(distance, 18, 30);
    PVector attractiveForceDirection = attractorToMover.get().normalize();
    float attractiveForceMag = mass * m.mass / sq(distance);

    return attractiveForceDirection.mult(attractiveForceMag);
  }

  void checkEdges() {
    if (location.x < width / 3) {
      velocity.x *= -1;
      location.x = width / 3;
    } else if (location.x > width / 3 * 2) {
      velocity.x *= -1;
      location.x = width / 3 * 2;
    }

    if (location.y < height / 3) {
      velocity.y *= -1;
      location.y = height / 3;
    } else if (location.y > height / 3 * 2) {
      velocity.y *= -1;
      location.y = height / 3 * 2;
    }
  }

  void update() {
    PVector accelerationChange = new PVector(
      map(noise(xoff), 0, 1, -0.09, 0.09),
      map(noise(xoff + 1000), 0, 1, -0.2, 0.2)
    );
    acceleration.add(accelerationChange);
    velocity.add(acceleration);
    velocity.limit(2);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
    xoff += 0.2;
  }

  void draw() {
    noStroke();
    fill(250);
    // circle(location.x, location.y, mass / 20);
  }
}