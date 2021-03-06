class Spaceship {
  Bullet[] bulletArr;
  PVector location, locationOff, velocity, acceleration, head, leftWing, rightWing;
  float angle;
  int bulletIndex;

  Spaceship() {
    location = new PVector(0, 0);
    locationOff = new PVector(width / 2, height /2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    head = new PVector(0, 0);
    leftWing = new PVector(0, 0);
    rightWing = new PVector(0, 0);
    angle = 0;
    bulletArr = new Bullet[10000];
    bulletIndex = 0;
  }

  void turnLeft() {
    angle -= 0.1;
  }

  void turnRight() {
    angle += 0.01;
  }

  void thrust() {
    acceleration.add(new PVector(random(-1.5, 1.5) * sin(angle), random(-1.5, 1.5) * cos(angle)));
    // acceleration.add(new PVector(random(-2, 2), random(-2, 2)));
  }

  void shoot() {
    bulletArr[bulletIndex] = new Bullet(locationOff, head, angle);
    bulletIndex++;
    if (bulletIndex >= bulletArr.length) {
      bulletIndex = 0;
    }
  }

  PVector getFriction() {
    PVector f = velocity.copy();
    f.mult(-1);
    f.normalize();
    f.mult(0.008);

    return f;
  }

  void checkEdges() {
    if (locationOff.x > width) {
      locationOff.x = 0;
    } else if (locationOff.x < 0) {
      locationOff.x = width;
    }

    if (locationOff.y > height) {
      locationOff.y = 0;
    } else if (locationOff.y < 0) {
      locationOff.y = height;
    }
  }

  void update() {
    turnRight();

    acceleration.add(getFriction());
    velocity.add(acceleration);
    velocity.limit(10);
    locationOff.add(velocity);

    head = PVector.add(location, new PVector(0, -30));
    leftWing = PVector.add(location, new PVector(-10, 0));
    rightWing = PVector.add(location, new PVector(10, 0));

    acceleration.mult(0);
    checkEdges();
  }

  void draw() {
    pushMatrix();
    translate(locationOff.x, locationOff.y);
    rotate(angle);
    update();
    fill(128, 236, 20);
    // triangle(leftWing.x, leftWing.y, head.x, head.y, rightWing.x, rightWing.y);
    popMatrix();

    for (Bullet b : bulletArr) {
      if (b != null) {
        b.draw();
      }
    }
  }
}