Pendulum[] pendulumArr = new Pendulum[350];

void setup() {
  size(1000, 1000);
  int armLength = 980;
  for (int i = 0; i < pendulumArr.length; i++) {
    pendulumArr[i] = new Pendulum(armLength);
    armLength -= 2;
  }
}

void draw() {
  background(0);
  for (Pendulum p : pendulumArr) {
    p.draw();
  }
  saveFrame("./output/####.png");
}
