import java.util.Iterator;

ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();

ParticleSystem ps;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  for (ParticleSystem ps : systems) {
    ps.addParticle();
    ps.run();
  }
}

void mousePressed() {
  systems.add(
    new ParticleSystem(
      new PVector(mouseX, mouseY)
    )
  );
}