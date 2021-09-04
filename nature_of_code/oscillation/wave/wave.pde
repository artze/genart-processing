void setup() {
  size(800, 800);
}

float startAngle = 0;
float aVelocity = 0.02;

void draw() {
  background(255);

  float angle = startAngle;

  noFill();
  stroke(0);
  strokeWeight(2);
  beginShape();
  for (int x = 0; x < width; x++) {
    float y = map(sin(angle), -1, 1, 0, height);
    vertex(x, y);
    angle += aVelocity;
  }
  endShape();
  startAngle += 0.02;
}

