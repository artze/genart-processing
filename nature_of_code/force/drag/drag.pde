Liquid liquid;
Mover[] moverArr = new Mover[10];

void setup () {
  size(800, 800);
  liquid = new Liquid(0, height - 600, width, 600, 80);
  for (int i = 0; i < moverArr.length; i++) {
    moverArr[i] = new Mover(random(10, 40), random(0, width), 0);
  }
}

void draw() {
  background(240);
  liquid.draw();
  for (Mover m : moverArr) {
    m.applyForce(new PVector(0, 0.1 * m.mass));
    if (m.isInLiquid(liquid)) {
      m.drag(liquid);
    }
    m.update();
    m.draw();
  }
}