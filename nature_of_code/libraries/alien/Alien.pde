class Alien {
  Body body;
  float w, h, r;
  Alien(float x, float y) {
    w = 10;
    h = 30;
    r = 12;

    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.setType(BodyType.DYNAMIC);
    body = box2d.createBody(bd);
    body.setLinearVelocity(new Vec2(random(-3, 3), random(-3, 3)));
    body.setAngularVelocity(random(-0.8, 0.8));

    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w / 2);
    float box2dH = box2d.scalarPixelsToWorld(h / 2);
    ps.setAsBox(box2dW, box2dH);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    Vec2 offset = new Vec2(0, -h / 2);
    offset = box2d.vectorPixelsToWorld(offset);
    cs.m_p.set(offset.x, offset.y);

    body.createFixture(ps, 1.0);
    body.createFixture(cs, 1.0);
  }

  void draw() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    rectMode(CENTER);
    noStroke();
    fill(255);
    rect(0, 0, w, h);
    circle(0, -h / 2, r * 2);
    popMatrix();
  }
}