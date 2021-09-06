float tileWidth = 15;

class TileSystem {
  Tile[] tileArr;
  int numPerRow;

  TileSystem() {
    numPerRow = ceil(width / tileWidth);
    int totalNumTiles = (int) sq(numPerRow);
    tileArr = new Tile[totalNumTiles];
    for (int i = 0; i < tileArr.length; i++) {
      tileArr[i] = new Tile(tileWidth);
    }
  }

  void draw() {
    float xoff = 0.0;
    float yoff = 0.0;

    for (int i = 0; i < numPerRow; i++) {
      pushMatrix();
      translate(i * tileWidth + tileWidth / 2, 0);
      yoff = 0.0;
      for (int j = 0; j < numPerRow; j++) {
        pushMatrix();
        translate(0, j * tileWidth + tileWidth / 2);
        tileArr[(i * numPerRow) + j].setNoiseOff(xoff, yoff);
        tileArr[(i * numPerRow) + j].draw();
        popMatrix();
        yoff += 0.05;
      }
      popMatrix();
      xoff += 0.05;
    }
  }
}