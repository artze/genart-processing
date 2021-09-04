Mover[] moverArr = new Mover[20000];
Attractor[] attractorArr = new Attractor[1];

void setup() {
  size(1024, 1024);
  frameRate(30);
  attractorArr[0] = new Attractor(new PVector(width / 2, height / 2), "cos");
  // attractorArr[1] = new Attractor(new PVector(width / 4 * 3, height / 4 * 3), "cos");
  PVector center = new PVector(width / 2, height / 2);
  for (int i = 0; i < moverArr.length; i++) {
    moverArr[i] = new Mover(
      random(0.5, 3),
      random(0, width),
      random(0, height)
    );
  }
};

void draw() {
  background(color(#040408));
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