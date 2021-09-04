class Pendulum {
  PVector location;
  float armLength, angle, angleVel, angleAcc;

  Pendulum(float armLength_) {
    armLength = armLength_;
    angle = radians(40);
    angleVel = 0;
    angleAcc = 0;
    location = new PVector();
  }

  void update() {
    angleAcc = -1 * 0.3 * sin(angle) / armLength;
    angleVel += angleAcc;
    angle += angleVel;
    location.set(
      armLength * sin(angle),
      armLength * cos(angle)
    );
    angleVel *= 0.999;
  }

  void draw() {
    update();
    push();
    translate(width / 2, 0);
    line(0, 0, location.x, location.y);
    circle(location.x, location.y, 10);
    pop();
  }
}

Pendulum p1;
Pendulum p2;
Pendulum p3;

void setup() {
  size(1000, 1000);
  p1 = new Pendulum(600);
  p2 = new Pendulum(590);
  p3 = new Pendulum(580);
}

void draw() {
  background(255);
  p1.draw();
  p2.draw();
  p3.draw();
}

