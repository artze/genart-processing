float monteCarloCustom() {
  while (true) {
    float r1 = random(1);
    float probablity = pow(r1, 2);
    // float probablity = r1;
    float r2 = random(1);
    if (r2 < probablity) {
      return r1;
    }
  }
}

class Walker {
  float x;
  float y;
  Walker() {
    x = width / 2;
    y = width / 2;
  }

  void step() {
    float stepSize = monteCarloCustom() * 10;
    x += random(-stepSize, stepSize);
    y += random(-stepSize, stepSize);
  }

  void display() {
    stroke(0);
    point(x, y);
  }
}

Walker w;

void setup() {
  size(800, 800);
  background(255);
  w = new Walker();
}

void draw() {
  w.step();
  w.display();
}