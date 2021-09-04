Bob b;
Spring s;

void setup() {
  size(800, 800);
  b = new Bob(new PVector(width / 2, 500));
  s = new Spring(new PVector(width / 2, 100));
}

void draw() {
  background(255);

  PVector g = new PVector(0, 0.1 * b.mass);
  b.applyForce(g);
  b.applyForce(new PVector(random(-0.02, 0.02), 0));
  s.connect(b);

  b.update();
  b.draw();
  s.draw(b);
}

