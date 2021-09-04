void setup() {
  size(800, 800);
}

float zOff = 0;
void draw() {
  loadPixels();
  float yOff = 0;
  for (int y = 0; y < height; y++) {
    float xOff = 0;
    for (int x = 0; x < width; x++) {
      // noiseDetail(8, 0.5);
      float bright = map(noise(xOff, yOff, zOff), 0, 1, 0, 255);
      pixels[x + y * width] = color(bright);
      xOff += 0.01;
      }
    yOff += 0.01;
  }
  updatePixels();
  zOff += 0.02;
}
