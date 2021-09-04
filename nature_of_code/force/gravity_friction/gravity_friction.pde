Mover[] moverArr = new Mover[50];

void setup() {
  size(1200, 1000);
  for (int i = 0; i < moverArr.length; i++) {
    moverArr[i] = new Mover(random(0, 3), 0, 0);
  }
}

void draw() {
  for (Mover m : moverArr) {
    PVector gravity = new PVector(0, 0.1 * m.mass);
    PVector wind = new PVector(0.01, 0);
    PVector friction = m.velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(0.08 * (m.mass / 10));

    m.applyForce(gravity);
    m.applyForce(wind);
    m.applyForce(friction);
    m.update();
    m.draw();
  }
}