Mover[] moverArr = new Mover[3];
Attractor a;

void setup() {
  size(800, 800);
  a = new Attractor();
  for (int i = 0; i < moverArr.length; i++) {
    moverArr[i] = new Mover(random(8, 16), random(0, width), random(0, height));
  }
};

void draw() {
  background(255);
  a.draw();
  for (Mover m : moverArr) {
    m.applyForce(a.getAttractiveForce(m));
    m.update();
    m.draw();
  }
};