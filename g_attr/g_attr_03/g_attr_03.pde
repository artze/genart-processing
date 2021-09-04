Mover[] moverArr = new Mover[600];

void setup() {
  size(1024, 1024);
  background(0);
  for (int i = 0; i < moverArr.length; i++) {
    moverArr[i] = new Mover(random(1, 6), random(0, width), random(0, height));
  }
};

void draw() {
  for (int i = 0; i < moverArr.length; i++) {
    for (int j = 0; j < moverArr.length; j++) {
      if (i != j) {
        moverArr[i].applyForce(moverArr[j].getAttractiveForce(moverArr[i]));
      }
    }
    moverArr[i].update();
    moverArr[i].draw();
  }
  // saveFrame("./output/####.png");
};