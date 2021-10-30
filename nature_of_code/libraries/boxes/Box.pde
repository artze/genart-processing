import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

class Box {
  float w, h;
  Body body;
  Box(float x, float y) {
    w = 12;
    h = 16;

    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.setType(BodyType.DYNAMIC);
    body = box2d.createBody(bd);
    body.setLinearVelocity(new Vec2(random(-2.8, 2.8), random(-2.8, 2.8)));
    body.setAngularVelocity(random(-0.8, 0.8));

    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w / 2);
    float box2dH = box2d.scalarPixelsToWorld(h / 2);
    ps.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 0.3;
    fd.density = 1;
    fd.restitution = 0.8;

    body.createFixture(fd);
  }

  void draw() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    rectMode(CENTER);
    strokeWeight(2);
    rect(0, 0, w, h);
    popMatrix();
  }
}