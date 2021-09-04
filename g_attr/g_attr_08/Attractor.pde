class Attractor {
  PVector location;
  String oscFunc;
  float mass;
  float period;

  Attractor(PVector location_, String oscFunc_) {
    location = location_;
    oscFunc = oscFunc_;
    period = 150;
    mass = 0;
  }

  PVector getAttractiveForce(Mover m) {
    PVector attractorToMover = PVector.sub(location, m.location);
    float distance = attractorToMover.mag();
    distance = constrain(distance, 50, 100);
    PVector attractiveForceDirection = attractorToMover.get().normalize();
    float attractiveForceMag = mass * m.mass / sq(distance);

    return attractiveForceDirection.mult(attractiveForceMag);
  }

  void update() {
    if (oscFunc.equals("sin")) {
      mass = map(sin((TWO_PI * frameCount / period) + 75), -1, 1, -200, 200);
    }
    if (oscFunc.equals("cos")) {
      mass = map(cos(TWO_PI * frameCount / period), -1, 1, -100, 200);
    }
  }

  void draw() {
    update();
    noStroke();
    fill(250);
    // circle(location.x, location.y, mass);
  }
}