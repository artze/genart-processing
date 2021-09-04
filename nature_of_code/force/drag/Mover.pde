class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
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

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }

  void drag(Liquid liquid) {
    float moverRadius = pow(mass, 1/3) / 2;
    float surfaceArea = 2 * PI * sq(moverRadius);
    float dragMag = sq(velocity.mag()) * liquid.c * (surfaceArea / 100);
    PVector dragF = velocity.get();
    dragF.normalize().mult(-1).mult(dragMag);
    applyForce(dragF);
  }

  boolean isInLiquid(Liquid liquid) {
    if (
      location.x > liquid.x &&
      location.x < (liquid.x + liquid.w) && 
      location.y > liquid.y &&
      location.y < (liquid.y + liquid.h)
    ) {
      return true;
    }
    return false;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }

  void draw() {
    stroke(0);
    fill(255);
    circle(location.x, location.y, mass * 2);
  }
}
