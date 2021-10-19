int screenSize = 720;
int totalCols = 72;
int totalRows = 72;
GOL gol;

void settings() {
  size(screenSize, screenSize);
}

void setup() {
  gol = new GOL(totalCols, totalRows);
  frameRate(15);
}

void draw() {
  gol.draw();
  // saveFrame("./output/####.png");
}
