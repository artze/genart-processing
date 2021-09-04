ParticleSystem ps;
PImage img;
ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();
int numSys = 1;

void setup() {
  size(1024, 1024);
  img = loadImage("SmokeParticle.png");
  for (int i = 0; i < numSys; i++) {
    systems.add(
      new ParticleSystem(
        new PVector(
          width / 2,
          height / 2
        )
      )
    );
  }
}

void draw() {
  blendMode(ADD);
  background(0);
  for (ParticleSystem ps : systems) {
    ps.addParticle();
    ps.run();
  }
  // saveFrame("./output/####.png");
}