Mover[] moverArr = new Mover[600];
Attractor[] attractorArr = new Attractor[5];

void setup() {
  size(1024, 1024);
  // frameRate(15);
  background(color(#040408));
  for (int i = 0; i < attractorArr.length; i++) {
    attractorArr[i] = new Attractor();
  }
  for (int i = 0; i < moverArr.length; i++) {
    moverArr[i] = new Mover(random(0.5, 3), random(0, width), random(0, height));
  }
};

void draw() {
  for (Attractor a : attractorArr) {
    a.draw();
  }
  for (Mover m : moverArr) {
    for (Attractor a : attractorArr) {
      m.applyForce(a.getAttractiveForce(m));
    }
    m.update();
    m.draw();
  }
  saveFrame("./output/####.png");
};