class Spaceship {
  Bullet[] bulletArr;
  PVector location;
  float theta, radius, heading, shiftAngle;
  int bulletIndex;
  String direction;

  Spaceship(String direction_) {
    location = new PVector(0, 0);
    radius = 0;
    shiftAngle = 0;
    bulletArr = new Bullet[10000];
    bulletIndex = 0;
    direction = direction_;

    if (direction.equals("right")) {
      theta = 0;
      heading = 0;
    }

    if (direction.equals("left")) {
      theta = PI;
      heading = PI;
    }
  }

  void shoot() {
    bulletArr[bulletIndex] = new Bullet(location, heading);
    bulletIndex++;
    if (bulletIndex >= bulletArr.length) {
      bulletIndex = 0;
    }
  }

  void resetTheta() {
    // if (theta / TWO_PI >= 1) {
    //   theta = 0;
    //   incrementShiftAngle();
    // }
  }

  void incrementShiftAngle() {
    shiftAngle += PI / 2;
  }

  void update() {
    location = new PVector(0, 0);
    if (direction.equals("right")) {
      radius = 90 + (100 * cos(theta - shiftAngle));
    }
    
    if (direction.equals("left")) {
      radius = 90 - (100 * cos(theta - shiftAngle));
    }
    location.add(new PVector(
      radius * cos(theta),
      radius * sin(theta)
    ));

    if (frameCount % 5 == 0) {
      shoot();
    }

    theta += 0.01;

    if (direction.equals("right")) {
      heading += 0.005;
    }
    
    if (direction.equals("left")) {
      heading += 0.005;
    }

    resetTheta();
  }

  void draw() {
    update();
    pushMatrix();
    // translate(width / 2, height / 2);
    // circle(location.x, location.y, 5);
    popMatrix();
    for (Bullet b : bulletArr) {
      if (b != null) {
        b.draw();
      }
    }
  }
}
