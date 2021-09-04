class Attractor {
  PVector location;
  float mass;

  Attractor(PVector location_) {
    location = location_;
    mass = random(190, 200);
  }

  PVector getAttractiveForce(Mover m) {
    PVector attractorToMover = PVector.sub(location, m.location);
    float distance = attractorToMover.mag();
    distance = constrain(distance, 2, 16);
    PVector attractiveForceDirection = attractorToMover.get().normalize();
    float attractiveForceMag = mass * m.mass / sq(distance);

    return attractiveForceDirection.mult(attractiveForceMag);
  }

  void draw() {
    noStroke();
    fill(250);
    // circle(location.x, location.y, mass * 2);
  }
}