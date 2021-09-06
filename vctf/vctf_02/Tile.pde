class Tile {
  float tileWidth, xoff, yoff, orbitRadius, xMovement, yMovement;

  Tile(float tileWidth_) {
    tileWidth = tileWidth_;
    xoff = 0;
    yoff = 0;
    orbitRadius = (tileWidth - 2) / 2;
    xMovement = 0.0;
    yMovement = 0.0;
  }

  void setNoiseOff(float xoff_, float yoff_) {
    xoff = xoff_;
    yoff = yoff_;
  }

  void draw() {
    // rectMode(CENTER);
    // noFill();
    // square(0, 0, tileWidth);
    // blendMode(ADD);
    float noiseValue = noise(xoff + map(sin(xMovement), 0, TWO_PI, 0, 30), yoff + map(sin(yMovement), 0, TWO_PI, 0, 30));
    noiseDetail(9);

    pushStyle();
    noFill();
    stroke(color(248, 237, 235));
    strokeWeight(0.5);
    circle(0, 0, orbitRadius * 2);
    popStyle();

    pushStyle();
    noStroke();
    fill(color(248, 237, 235));
    circle(0, 0, tileWidth / 4.2);
    popStyle();

    pushMatrix();
    rotate(
      map(
        noiseValue,
        0,
        1,
        0,
        TWO_PI
      )
    );

    pushStyle();
    noStroke();
    fill(255, 255, 63, 255);
    circle(0, -orbitRadius - 22, tileWidth / map(noiseValue, 0, 1, 0.2, 2.5));
    popStyle();
    pushStyle();
    noStroke();
    fill(2, 62, 138, 255);
    circle(0, orbitRadius - 3, tileWidth / 2.1);
    popStyle();
    popMatrix();

    xMovement += 0.004;
    yMovement += 0.004;
  }
}