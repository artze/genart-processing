class Repl {
  PVector location;
  float mass;

  Repl(PVector location_, float mass_) {
    location = location_;
    mass = mass_;
  }

  PVector getReplForce(Particle p) {
    PVector f = PVector.sub(location, p.location);
    float d = f.mag();
    d = constrain(d, 5, 22);
    f.normalize();
    float fMag = -1 * p.mass * mass / (d * d);
    f.mult(fMag);

    return f;
  }

  void draw() {
    circle(location.x, location.y, mass);
  }
}