ParticleSystem ps;
PImage img;

void setup() {
  size(800, 800);
  img = loadImage("SmokeParticle.png");
  ps = new ParticleSystem(
    new PVector(width / 2, height / 2)
  );
}

void draw() {
  blendMode(ADD);
  background(0);
  ps.addParticle();
  float dx = map(mouseX, 0, width, 0.4, -0.4);
  ps.applyForce(new PVector(dx, 0));
  ps.run();
}