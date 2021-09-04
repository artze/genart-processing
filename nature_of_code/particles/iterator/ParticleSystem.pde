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

  void run() {
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.applyForce(new PVector(0, 0.1 * p.mass));
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
}
