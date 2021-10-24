int screenSize = 720;
int totalCols = 144;
int totalRows = 144;
GOL gol;

void settings() {
  size(screenSize, screenSize);
}

void setup() {
  gol = new GOL(totalCols, totalRows);
  frameRate(8);
}

void draw() {
  gol.draw();
  // saveFrame("./output/####.png");
}
