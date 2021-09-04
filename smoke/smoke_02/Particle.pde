import java.util.Random;

class Particle {

  PVector location, velocity, acceleration;
  float lifespan;

  Particle(PVector location_) {
    location = location_.copy();
    acceleration = new PVector();
    lifespan = 255;

    Random generator = new Random();
    float vx = (float) generator.nextGaussian() * 0.5;
    float vy = (float) generator.nextGaussian() * 0.5;
    velocity = new PVector(vx, vy);
  }

  void applyAcceleration(PVector acc) {
    acceleration.add(acc);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 1.5;
  }

  void draw() {
    imageMode(CENTER);
    tint(255, lifespan);
    image(img, location.x, location.y, 175, 175);
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
