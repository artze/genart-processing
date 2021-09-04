class Spaceship {
  Bullet[] bulletArr;
  PVector location;
  float theta, radius, heading;
  int bulletIndex;
  String direction;

  Spaceship(String direction_) {
    location = new PVector(0, 0);
    radius = 0;
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

  void update() {
    location = new PVector(0, 0);
    if (direction.equals("right")) {
      radius = map(sin(theta), -1, 1, 90, 600) + (100 * cos(theta));
    }
    
    if (direction.equals("left")) {
      radius = map(cos(theta), -1, 1, 90, 600) - (100 * cos(theta));
    }

    location.add(new PVector(
      radius * cos(theta),
      radius * sin(theta)
    ));

    if (frameCount % 4 == 0) {
      shoot();
    }

    theta += 0.01;

    if (direction.equals("right")) {
      heading += 0.005;
    }
    
    if (direction.equals("left")) {
      heading += 0.005;
    }
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
