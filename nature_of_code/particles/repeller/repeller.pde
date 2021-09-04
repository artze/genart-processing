import java.util.Iterator;

ArrayList<ParticleSystem> systems = new ArrayList<ParticleSystem>();

ParticleSystem ps;
Repl r;

void setup() {
  size(800, 800);
  r = new Repl(new PVector(width / 2, height / 2), 50);
}

void draw() {
  background(0);
  for (ParticleSystem ps : systems) {
    ps.addParticle();
    ps.applyGravity();
    ps.applyRepeller(r);
    ps.run();
  }
}

void mousePressed() {
  systems.add(
    new ParticleSystem(new PVector(mouseX, mouseY))
  );
}