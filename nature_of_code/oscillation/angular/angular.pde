Mover m;
void setup() {
  size(800, 800);
  m = new Mover();
}

void draw() {
  background(255);
  m.update();
  m.draw();
}