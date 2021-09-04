class Snake {
  PVector location;
  PVector velocity;
  PVector distortionAcceleration;
  float distortStart;
  float distortEnd;
  float yPos;
  float xOff;
  boolean shouldRecover;

  Snake(float yPos_, float distortStart_, float distortEnd_) {
    yPos = yPos_;
    location = new PVector(0, yPos);
    velocity = new PVector(1, 0);
    xOff = 0;
    distortStart = distortStart_;
    distortEnd = distortEnd_;
  }

  void distort() {
    // PVector rand = new PVector(location.x + 20, map(noise(xOff), 0, 1, 0, 800));
    PVector rand = new PVector(location.x, 100);
    PVector distortDir = PVector.sub(rand, location);
    // distortDir.normalize();

    distortionAcceleration = new PVector(0, -10);
    // distortionAcceleration.mult(25);

    velocity.add(distortionAcceleration);
    // velocity.limit(random(10, 50));

    // xOff++;
    shouldRecover = true;
  }

  void recover() {
    velocity.add(new PVector(0, 20));
    shouldRecover = false;
  }

  void update() {
    if (shouldRecover) {
      recover();
    } else if (location.x > 300 && location.x < 302) { 
      distort();
    } 
    location.add(velocity);
    checkEdges();
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } 
  }

  void draw() {
    point(location.x, location.y);
  }
}

Snake s;
void setup() {
  size(800, 800);
  background(#faedcd);
  s = new Snake(height / 2, 200, 600);
}

void draw() {
  s.update();
  s.draw();
}