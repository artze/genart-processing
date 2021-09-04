import java.util.Random;

class Particle {

  PVector location, velocity, acceleration;
  float lifespan, mass, xOff, perlinOff;

  Particle(PVector location_) {
    location = location_.copy();
    acceleration = new PVector();
    lifespan = 255;
    mass = 8;
    xOff = 0.0;
    perlinOff = random(100, 100000);

    Random generator = new Random();
    float vx = (float) generator.nextGaussian() * 0.5;
    float vy = (float) generator.nextGaussian() * 0.3 - 2.0;
    velocity = new PVector(vx, vy);
  }

  void applyAcceleraion(PVector acc) {
    acceleration.add(acc);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 0.5;
    xOff += 0.0001;
  }

  void draw() {
    float size = map(noise(xOff + perlinOff), 0, 1, 50, 300);
    imageMode(CENTER);
    tint(255, lifespan);
    image(img, location.x, location.y, size, size);
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
