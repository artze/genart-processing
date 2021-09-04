class Bullet {
  PVector locationOff, location, velocity;
  float angle;

  Bullet(PVector locationOff_, PVector head_, float angle_) {
    locationOff = locationOff_.copy();
    location = head_.copy();
    velocity = new PVector(0, -6);
    angle = angle_;
  }

  void update() {
    location.add(velocity);
  }

  void draw() {
    update();
    push();
    fill(255, 89, 0);
    stroke(255, 89, 0, 200);
    strokeWeight(0.5);
    translate(locationOff.x, locationOff.y);
    rotate(angle);
    line(0, 0, location.x, location.y);
    circle(location.x, location.y, 2);
    pop();
  }
}