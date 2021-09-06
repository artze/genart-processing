TileSystem ts;

void setup() {
  size(1000, 1000);
  ts = new TileSystem();
}

void draw() {
  background(color(20, 33, 61));
  ts.draw();
  // saveFrame("./output/####.png");
}
