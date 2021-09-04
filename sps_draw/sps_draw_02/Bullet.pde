class Bullet {
  PVector spaceshipLocation, location, velocity;
  float angle;

  Bullet(PVector spaceshipLocation_, float angle_) {
    spaceshipLocation = spaceshipLocation_.copy();
    velocity = new PVector(0, -6);
    angle = angle_;
    location = new PVector(0, 0);
  }

  void update() {
    if (location.x < width / 2 && location.y < height / 2) {
      location.add(velocity);
    }
  }

  void draw() {
    update();
    push();
    fill(255, 89, 0);
    stroke(255, 89, 0, 200);
    strokeWeight(0.5);

    translate(width / 2, height / 2);
    translate(spaceshipLocation.x, spaceshipLocation.y);
    rotate(angle);
    line(0, 0, location.x, location.y);
    circle(location.x, location.y, 2);
    pop();
  }
}