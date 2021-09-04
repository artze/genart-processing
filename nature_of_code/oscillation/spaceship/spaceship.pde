class Bullet {
  PVector locationOff, location, velocity;
  float angle;

  Bullet(PVector locationOff_, PVector head_, float angle_) {
    locationOff = locationOff_.copy();
    location = head_.copy();
    velocity = new PVector(0, -6);
    angle = angle_;
  }

  void update() {
    location.add(velocity);
  }

  void draw() {
    update();
    pushMatrix();
    fill(128, 236, 20);
    stroke(128, 236, 20);
    translate(locationOff.x, locationOff.y);
    rotate(angle);
    line(0, 0, location.x, location.y);
    circle(location.x, location.y, 4);
    popMatrix();
  }
}

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
    bulletArr = new Bullet[100];
    bulletIndex = 0;
  }

  void turnLeft() {
    angle -= 0.1;
  }

  void turnRight() {
    angle += 0.1;
  }

  void thrust() {
    acceleration.add(new PVector(0.8 * sin(angle), -0.8 * cos(angle)));
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
    triangle(leftWing.x, leftWing.y, head.x, head.y, rightWing.x, rightWing.y);
    popMatrix();

    for (Bullet b : bulletArr) {
      if (b != null) {
        b.draw();
      }
    }
  }
}

Spaceship s;

void setup() {
  fullScreen();
  s = new Spaceship();
}

void draw() {
  background(0);
  s.draw();
}

void keyPressed() {
  if (keyCode == LEFT) {
    s.turnLeft();
  }
  if (keyCode == RIGHT) {
    s.turnRight();
  }
  if (keyCode == UP) {
    s.thrust();
  }
  if (key == ' ') {
    s.shoot();
  }
}