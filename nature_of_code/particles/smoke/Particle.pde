import java.util.Random;

class Particle {

  PVector location, velocity, acceleration;
  float lifespan, mass;

  Particle(PVector location_) {
    location = location_.copy();
    acceleration = new PVector();
    lifespan = 255;
    mass = 8;

    Random generator = new Random();
    float vx = (float) generator.nextGaussian() * 0.3;
    float vy = (float) generator.nextGaussian() * 0.1 - 1.0;
    velocity = new PVector(vx, vy);
  }

  void applyForce(PVector f) {
    PVector g = PVector.div(f, mass);
    acceleration.add(g);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan--;
  }

  void draw() {
    imageMode(CENTER);
    tint(255, lifespan);
    image(img, location.x, location.y, 100, 100);
  }

  void run() {
    update();
    draw();
  }

  boolean isDead() {
    if (lifespan < 0) {
      return true;
    }
    return false;
  }
}
