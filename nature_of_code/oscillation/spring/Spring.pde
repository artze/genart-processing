class Spring {
  float restLength, k;
  PVector anchor, springForce;

  Spring(PVector anchor_) {
    restLength = 200;
    k = 0.1;
    anchor = anchor_;
  }

  void connect(Bob b) {
    springForce = PVector.sub(b.location, anchor);
    float currentLength = springForce.mag();
    float x = currentLength - restLength;

    springForce.normalize();
    springForce.mult(-1 * k * x);

    b.applyForce(springForce);
  }

  void draw(Bob b) {
    circle(anchor.x, anchor.y, 2);
    line(anchor.x, anchor.y, b.location.x, b.location.y);
  }
}