class Bullet {
  PVector spaceshipLocation, location, velocity, translateDistortion;
  float angle, scaleFactor;

  Bullet(PVector spaceshipLocation_, float angle_) {
    spaceshipLocation = spaceshipLocation_.copy();
    velocity = new PVector(0, -2);
    angle = angle_;
    location = new PVector(0, 0);
    scaleFactor = random(0.2, 0.45);
    translateDistortion = new PVector(random(-100, 100), random(-100, 100));
  }

  void update() {
    location.add(velocity);
  }

  void draw() {
    update();
    push();
    // fill(48, 242, 242, 200);
    // stroke(48, 242, 242, 200);

    fill(252, 255, 75, 200);
    stroke(252, 255, 75, 200);

    strokeWeight(0.5);

    translate((width / 2) + translateDistortion.x, (height / 2) + translateDistortion.y);
    scale(scaleFactor);
    translate(spaceshipLocation.x, spaceshipLocation.y);
    rotate(angle);
    line(0, 0, location.x, location.y);
    circle(location.x, location.y, 6);
    pop();
  }
}