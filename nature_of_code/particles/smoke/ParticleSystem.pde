import java.util.Iterator;

class ParticleSystem {

  PVector location;
  ArrayList<Particle> particles;

  ParticleSystem(PVector location_) {
    location = location_;
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(location));
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}
