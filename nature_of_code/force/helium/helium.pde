class Balloon {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float xOff;
  Balloon() {
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    xOff = 0;
  }

  void floatUp() {
    if (location.y > 140) {
      PVector floatDest = new PVector(location.x, 0);
      PVector floatUpForce = PVector.sub(floatDest, location);
      floatUpForce.normalize();
      floatUpForce.mult(0.02);

      acceleration.add(floatUpForce);
    }
  }

  void bounceBack() {
    if (location.y <= 140) {
      float velocityBeforeImpact = velocity.mag();
      float decelerationMag = velocityBeforeImpact / 1.6;
      PVector bounceBackDest = new PVector(location.x, height);
      PVector bounceBackForce = PVector.sub(bounceBackDest, location);
      bounceBackForce.normalize();
      bounceBackForce.mult(decelerationMag);

      velocity.mult(0);
      acceleration.add(bounceBackForce);
    }
  }

  void wind() {
    if (random(1) < 0.1) {
      PVector blownDest = new PVector(
        map(noise(xOff), 0, 1, 0, width),
        map(noise(xOff + 1000), 0, 1, 0, height)
      );
      PVector blownForce = PVector.sub(blownDest, location);
      blownForce.normalize();
      blownForce.mult(random(1));

      acceleration.add(blownForce);
      xOff += 0.1;
    }
  }

  void checkEdges() {
    if (location.x < 0) {
      location.x = width;
    } else if (location.x > width) {
      location.x = 0;
    }
  }

  void update() {
    floatUp();
    wind();
    bounceBack();
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }

  void draw() {
    circle(location.x, location.y, 80);
  }
}

Balloon b;
void setup() {
  size(800, 800);
  b = new Balloon();
}

void draw() {
  background(#ffffff);
  line(0, 100, width, 100);
  b.update();
  b.draw();
}