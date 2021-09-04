Pendulum[] pendulumArr = new Pendulum[150];

void setup() {
  size(1000, 1000);
  int armLength = 950;
  for (int i = 0; i < pendulumArr.length; i++) {
    pendulumArr[i] = new Pendulum(armLength);
    armLength -= 5;
  }
}

void draw() {
  background(0);
  for (Pendulum p : pendulumArr) {
    p.draw();
  }
}
