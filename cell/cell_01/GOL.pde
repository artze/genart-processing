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

  void setupGrid() {
    for (int i = 0; i < totalCols; i++) {
      for (int j = 0; j < totalRows; j++) {
        int initValue = 0;
        if (i > 38 && i < 43 && j > 5 && j < 75) {
          if (random(1) > 0.1) {
            initValue = 1;
          }
        }
        grid[i][j] = new Cell(i, j, cellSize, initValue);
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
        } else if (c.value == 0 && (neighbours == 3)) {;
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