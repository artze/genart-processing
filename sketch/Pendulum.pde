class Pendulum {
  PVector location;
  float armLength, angle, angleVel, angleAcc, distOffset;

  Pendulum(float armLength_) {
    armLength = armLength_;
    angle = radians(42);
    angleVel = 0;
    angleAcc = 0;
    location = new PVector();
    distOffset = 0;
  }

  void update() {
    float armLengthDistortion = map(sin(distOffset), -1, 1, -200, 200);

    angleAcc = -1 * 0.45 * sin(angle) / (armLength + armLengthDistortion);
    angleVel += angleAcc;
    angle += angleVel;

    
    location.set(
      (armLength + armLengthDistortion) * sin(angle),
      (armLength + armLengthDistortion) * cos(angle)
    );
    angleVel *= 0.999;
    distOffset += 0.01;
  }

  void draw() {
    update();
    push();
    translate(width / 2, 0);
    // line(0, 0, location.x, location.y);
    noStroke();
    fill(255);
    circle(location.x, location.y, 7);
    pop();
  }
}
