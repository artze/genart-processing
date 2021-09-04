Mover[] moverArr = new Mover[20];

void setup() {
  size(800, 800);
  background(255);
  for (int i = 0; i < moverArr.length; i++) {
    moverArr[i] = new Mover(random(3, 8), random(0, width), random(0, height));
  }
};

void draw() {
  background(255);
  for (int i = 0; i < moverArr.length; i++) {
    for (int j = 0; j < moverArr.length; j++) {
      if (i != j) {
        moverArr[i].applyForce(moverArr[j].getAttractiveForce(moverArr[i]));
      }
    }
    moverArr[i].update();
    moverArr[i].draw();
  }
};