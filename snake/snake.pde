class Snake {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float distortStart;
  float distortEnd;
  float yPos;

  Snake(float yPos_, float distortStart_, float distortEnd_) {
    yPos = yPos_;
    location = new PVector(0, yPos);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    distortStart = distortStart_;
    distortEnd = distortEnd_;
  }

  void distort() {
    PVector distort = new PVector(location.x, 300);
    PVector distortF = PVector.sub(distort, location);
    acceleration.add(distortF);
  }

  void moveRight() {
    PVector constant = new PVector(location.x + 1, yPos);
    PVector constantF = PVector.sub(constant, location);
    acceleration.add(constantF);
  }

  void update() {
    if (location.x > distortStart && location.x < distortEnd) {
      if (random(1) > 0.8) {
        distort();
      }
    }
    moveRight();
    velocity.add(acceleration);
    location.add(velocity);
    checkEdges();
    acceleration.mult(0);
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
  s = new Snake(height / 2, 350, 400);
}

void draw() {
  s.update();
  s.draw();
}