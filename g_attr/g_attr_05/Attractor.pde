class Attractor {
  PVector location, velocity, acceleration;
  float mass;
  String section;

  Attractor(PVector location_, String section_) {
    location = location_;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random(300, 320);
    section = section_;
  }

  PVector getAttractiveForce(Mover m) {
    PVector attractorToMover = PVector.sub(location, m.location);
    float distance = attractorToMover.mag();
    distance = constrain(distance, 40, 45);
    PVector attractiveForceDirection = attractorToMover.get().normalize();
    float attractiveForceMag = mass * m.mass / sq(distance);

    return attractiveForceDirection.mult(attractiveForceMag);
  }

  void checkEdges() {
    if (section == "tl") {
      if (location.x < 0) {
        velocity.x *= -1;
        location.x = 0;
      } else if (location.x > width / 3) {
        velocity.x *= -1;
        location.x = width / 3;
      }

      if (location.y < 0) {
        velocity.y *= -1;
        location.y = 0;
      } else if (location.y > height / 4) {
        velocity.y *= -1;
        location.y = height / 4;
      }
    } else if (section == "tr") {
      if (location.x < width / 3 * 2) {
        velocity.x *= -1;
        location.x = width / 3 * 2;
      } else if (location.x > width) {
        velocity.x *= -1;
        location.x = width;
      }

      if (location.y < 0) {
        velocity.y *= -1;
        location.y = 0;
      } else if (location.y > height / 4) {
        velocity.y *= -1;
        location.y = height / 4;
      }
    } else if (section == "bc") {
      if (location.x < 0) {
        velocity.x *= -1;
        location.x = 0;
      } else if (location.x > width) {
        velocity.x *= -1;
        location.x = width;
      }

      if (location.y < height / 3 * 2) {
        velocity.y *= -1;
        location.y = height / 3 * 2;
      } else if (location.y > height) {
        velocity.y *= -1;
        location.y = height;
      }
    }
  }

  void update() {
    PVector accelerationChange = new PVector(
      random(-0.02, 0.02),
      random(-0.02, 0.02)
    );
    acceleration.add(accelerationChange);
    velocity.add(acceleration);
    velocity.limit(2);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }

  void draw() {
    noStroke();
    fill(250);
    // circle(location.x, location.y, mass / 20);
  }
}