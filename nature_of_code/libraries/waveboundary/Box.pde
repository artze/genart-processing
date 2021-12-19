class Box {
  float w, h;
  Body body;
  Vec2 pos;

  Box(float x, float y) {
    // w = random(4, 7);
    // h = random(6, 9);

    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.setType(BodyType.DYNAMIC);
    body = box2d.createBody(bd);
    body.setLinearVelocity(new Vec2(random(-3, 3), random(-3, 3)));
    body.setAngularVelocity(random(-2, 2));

    PolygonShape ps = new PolygonShape();
    Vec2 [] vertices = new Vec2[4];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-15, 25));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(15, 0));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(20, -15));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(-10, 10));
    ps.set(vertices, vertices.length);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.friction = 8;
    fd.density = 50;
    fd.restitution = 0.2;

    body.createFixture(fd);
  }

  void draw() {
    pos = box2d.getBodyPixelCoord(body);
    float angle = body.getAngle();

    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-angle);
    rectMode(CENTER);
    strokeWeight(2);
    stroke(255);
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++) {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape();
    popMatrix();
  }
}