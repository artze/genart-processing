Mover[] moverArr = new Mover[20000];
Attractor[] attractorArr = new Attractor[3];

void setup() {
  size(1024, 1024);
  frameRate(30);
  attractorArr[0] = new Attractor(new PVector(50, 1), "tl");
  attractorArr[1] = new Attractor(new PVector(width - 50, 1), "tr");
  attractorArr[2] = new Attractor(new PVector(width / 2, height), "bc");
  PVector center = new PVector(width / 2, height / 2);
  for (int i = 0; i < moverArr.length; i++) {
    moverArr[i] = new Mover(
      random(0.5, 2),
      random(center.x - 300, width),
      random(0, height)
    );
  }
};

void draw() {
  background(color(#040408));
  for (Attractor a : attractorArr) {
    a.update();
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