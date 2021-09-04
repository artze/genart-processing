class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  color pointColor;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(-3, -18);
    acceleration = new PVector(0, 0);
    if (random(0, 1) < 0.3) {
      pointColor = color(255, 10, 0);
    } else if (random(0, 1) < 0.6) {
      pointColor = color(199, 51, 209);
    } else {
      pointColor = color(230, 230, 230);
    }
  }

  void applyForce(PVector f) {
    PVector fCopy = PVector.div(f, mass);
    acceleration.add(fCopy);
  };

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
    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }

  void draw() {
    stroke(pointColor);
    strokeWeight(0.6);
    point(location.x, location.y);
  }
}
