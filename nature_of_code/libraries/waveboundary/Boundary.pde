class Boundary {
  ArrayList<Vec2> boundary;
  Body body;

  Boundary() {
    boundary = new ArrayList<Vec2>();

    boundary.add(new Vec2(0, 450));
    boundary.add(new Vec2(0, height));
    boundary.add(new Vec2(width, height));
    boundary.add(new Vec2(width, 450));

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    body = box2d.createBody(bd);

    Vec2[] vertices = new Vec2[boundary.size()];
    for (int i = 0; i < boundary.size(); i++) {
      vertices[i] = new Vec2(box2d.coordPixelsToWorld(boundary.get(i)));
    }

    ChainShape chain = new ChainShape();
    chain.createChain(vertices, vertices.length);

    FixtureDef fd = new FixtureDef();
    fd.shape = chain;
    fd.density = 1.2;
    fd.restitution = 0.5;
    fd.friction = 2;

    body.createFixture(fd);
  }

  void draw() {
    push();
    noStroke();
    noFill();
    beginShape();
    for (Vec2 b : boundary) {
      vertex(b.x, b.y);
    }
    endShape();
    pop();
  }
}