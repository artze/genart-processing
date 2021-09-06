TileSystem ts;

void setup() {
  size(1000, 1000);
  ts = new TileSystem();
}

void draw() {
  background(255);
  ts.draw();
  // saveFrame("./output/####.png");
}
