class Cell {
  int value, col, row;
  float cellSize;
  color cellColor;

  Cell(int col_, int row_, float cellSize_, int value_) {
    value = value_;
    col = col_;
    row = row_;
    cellSize = cellSize_;
    cellColor = getCellColor();
  }

  color getCellColor() {
    if (value == 1) {
      return color(255, 255, 255);
    } else {
      return color(0, 0, 0);
    }
  }

  void setValue(int value_) {
    value = value_;
  }

  void draw() {
    push();
    noStroke();
    cellColor = getCellColor();
    fill(cellColor);
    square(col * cellSize, row * cellSize, cellSize);
    pop();
  }
}