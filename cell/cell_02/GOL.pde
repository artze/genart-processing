class GOL {
  int totalCols, totalRows;
  Cell[][] grid;
  float cellSize;

  GOL(int totalCols_, int totalRows_) {
    totalCols = totalCols_;
    totalRows = totalRows_;
    grid = new Cell[totalCols][totalRows];
    cellSize = width / totalCols;
    setupGrid();
  }

  int getCellValue(int col, int row) {
    int margin = 6;
    int numRepeat = floor(totalCols / margin);

    for (int i = 0; i < numRepeat; i++) {
      for (int j = 0; j < numRepeat; j++) {
        if (j % 2 == 0 && i % 2 == 0) {
          continue;
        }
        if (j % 2 == 1 && i % 2 == 1) {
          continue;
        }
        if (col == 1 + (margin * i) && row == 1 + (margin * j)) {
          return 1;
        }
        if (col == 2 + (margin * i) && row == 2 + (margin * j)) {
          return 1;
        }
        if (col == 3 + (margin * i) && row == 2 + (margin * j)) {
          return 1;
        }
        if (col == 1 + (margin * i) && row == 3 + (margin * j)) {
          return 1;
        }
        if (col == 2 + (margin * i) && row == 3 + (margin * j)) {
          return 1;
        }
      }
    }

    return 0;
  }

  void setupGrid() {
    for (int i = 0; i < totalCols; i++) {
      for (int j = 0; j < totalRows; j++) {
        grid[i][j] = new Cell(i, j, cellSize, getCellValue(i, j));
      }
    }
  }

  void evaluateNextGen() {
    Cell[][] nextGen = new Cell[totalCols][totalRows];

    for (int i = 0; i < totalCols; i++) {
      for (int j = 0; j < totalRows; j++) {
        Cell c = grid[i][j];
        int neighbours = 0;

        for (int k = -1; k < 2; k++) {
          for (int l = -1; l < 2; l++) {
            if (k == 0 && l == 0) {
              continue;
            }
            Cell nc = grid[(i + k + totalCols) % totalCols][(j + l + totalRows) % totalRows];
            neighbours += nc.value;
          }
        }

        if (c.value == 1 && (neighbours < 2 || neighbours > 3)) {
          nextGen[i][j] = new Cell(i, j, cellSize, 0);
        } else if (c.value == 0 && (neighbours == 3)) {
          nextGen[i][j] = new Cell(i, j, cellSize, 1);
        } else {
          nextGen[i][j] = new Cell(i, j, cellSize, c.value);
        }
      }
    }
    grid = nextGen;
  }

  void draw() {
    for (int i = 0; i < totalCols; i++) {
      for (int j = 0; j < totalRows; j++) {
        Cell c = grid[i][j];
        c.draw();
      }
    }
    evaluateNextGen();
  }
}