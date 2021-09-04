class Bob {
  PVector location1;
  PVector location2;
  float minHeight = height / 4;
  float maxHeight = height / 4 * 3;
  Bob() {
    location1 = new PVector(width / 4, minHeight);
    location2 = new PVector(width / 4 * 3, minHeight);
  }

  void update() {
    int period = 120;
    location1.y = map(sin(TWO_PI * frameCount / period + period / 4), -1, 1, minHeight, maxHeight);
    location2.y = map(cos(TWO_PI * frameCount / period), -1, 1, minHeight, maxHeight);
  }

  void draw() {
    update();
    circle(location1.x, location1.y, 15);
    circle(location2.x, location2.y, 15);
  }
}

Bob b;

void setup() {
  size(800, 800);
  frameRate(30);
  b = new Bob();
}

void draw() {
  background(255);
  b.draw(); 
}