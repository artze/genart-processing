class CircleMover {
  float radius;
  float angleOffset;
  float xOff;
  PVector location;
  PVector velocity;
  PVector acceleration;
  CircleMover(float radius_) {
    radius = radius_;
    angleOffset = 0;
    xOff = 0;
    location = new PVector(width / 2 - radius, height/2);
    acceleration = new PVector(0, 0);
  }

  void update() {
    acceleration.add(
      map(noise(xOff), 0, 1, -10, 10),
      map(noise(xOff + 10000), 0, 1, -10, 10)
    );
    velocity = new PVector(radius * sin(angleOffset), radius * cos(angleOffset));
    velocity.add(acceleration);
    velocity.normalize();
    velocity.mult(2);
    location.add(velocity);
    angleOffset += 0.01;
    xOff += 2.4;
  }

  void draw() {
    noStroke();
    fill(0);
    circle(location.x, location.y, 5);
  }
}

CircleMover cm;

void setup() {
  size(800, 800);
  background(#ffffff);
  cm = new CircleMover(200);
}

void draw() {
  cm.update();
  cm.draw(); 
}