import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;

Box2DProcessing box2d;

void setup() {
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  BodyDef bd = new BodyDef();
  Vec2 center = box2d.coordPixelsToWorld(width / 2, height / 2);
  bd.position.set(center);
  bd.setType(BodyType.DYNAMIC);

  Body body = box2d.createBody(bd);
  body.setLinearVelocity(new Vec2(0, 3));

  PolygonShape ps = new PolygonShape();
  float box2Dw = box2d.scalarPixelsToWorld(150);
  float box2Dh = box2d.scalarPixelsToWorld(100);
  ps.setAsBox(box2Dw, box2Dh);

  FixtureDef fd = new FixtureDef();
  fd.shape = ps;
  fd.density = 1;
  fd.friction = 0.3;
  fd.restitution = 0.5;

  body.createFixture(fd);
}

void draw() {

}
