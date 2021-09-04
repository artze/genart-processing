class Particle {

  PVector location, velocity, acceleration;
  float lifespan, mass;

  Particle(PVector location_) {
    location = location_.copy();
    velocity = new PVector();
    acceleration = new PVector(random(-3, 3), 0);
    lifespan = 255;
    mass = 8;
  }

  void applyForce(PVector f) {
    PVector g = PVector.div(f, mass);
    acceleration.add(g);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan--;
  }

  void draw() {
    push();
    noStroke();
    fill(240, 240, 240, lifespan);
    circle(location.x, location.y, mass * 0.3);
    pop();
  }

  void run() {
    update();
    draw();
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    }
    return false;
  }
}
