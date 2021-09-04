class Attractor {
  PVector location;
  float mass;

  Attractor() {
    location = new PVector(width/ 2, height / 2);
    mass = 50;
  }

  PVector getAttractiveForce(Mover m) {
    PVector attractorToMover = PVector.sub(location, m.location);
    float distance = attractorToMover.mag();
    distance = constrain(distance, 5, 40);
    PVector attractiveForceDirection = attractorToMover.get().normalize();
    float attractiveForceMag = mass * m.mass / sq(distance);

    return attractiveForceDirection.mult(attractiveForceMag);
  }

  void draw() {
    fill(175);
    circle(location.x, location.y, mass * 2);
  }
}