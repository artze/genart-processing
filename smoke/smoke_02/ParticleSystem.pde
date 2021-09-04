import java.util.Iterator;

class ParticleSystem {

  PVector location;
  ArrayList<Particle> particles;
  float xOff, perlinOff;

  ParticleSystem(PVector location_) {
    location = location_;
    particles = new ArrayList<Particle>();
    xOff = 0.0;
    perlinOff = random(100, 100000);
  }

  void addParticle() {
    particles.add(new Particle(location));
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      if (random(1) > 0.5) {
        p.applyAcceleration(
          new PVector(
            map(noise(xOff), 0, 1, -0.6, 0.6),
            map(noise(xOff + perlinOff), 0, 1, -0.6, 0.6)
          )
        );
      }
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
    xOff += 0.1;
  }
}
