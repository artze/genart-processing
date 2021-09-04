Mover[] moverArr = new Mover[600];
Attractor[] attractorArr = new Attractor[2];

void setup() {
  size(1024, 1024);
  frameRate(30);
  attractorArr[0] = new Attractor(new PVector(width / 4, height / 4));
  attractorArr[1] = new Attractor(new PVector(width / 4 * 3, height / 4 * 3));
  PVector center = new PVector(width / 2, height / 2);
  for (int i = 0; i < moverArr.length; i++) {
    moverArr[i] = new Mover(
      random(0.5, 3),
      random(center.x - 100, center.x + 100),
      random(center.y - 100, center.y + 100)
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
  // saveFrame("./output/####.png");
};