void setup() {
  size(800, 800);
}

float r = 0;
float theta = 0;

void draw() {
  float x = r * cos(theta);
  float y = r * sin(theta);
  noStroke();
  fill(0);
  translate(width / 2, height / 2);
  ellipse(x, y, 10, 10);

  theta += 0.02;
  r += 0.05;
}
