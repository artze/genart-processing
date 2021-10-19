int screenSize = 800;
int totalCols = 80;
int totalRows = 80;
GOL gol;

void settings() {
  size(screenSize, screenSize);
}

void setup() {
  gol = new GOL(totalCols, totalRows);
  frameRate(10);
}

void draw() {
  gol.draw();
  saveFrame("./output/####.png");
}
