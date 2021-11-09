class Surface {
  ArrayList<Vec2> surface;
  Body body;

  Surface() {
    surface = new ArrayList<Vec2>();
    surface.add(new Vec2(50, 500));
    surface.add(new Vec2(320, 680));
    surface.add(new Vec2(600, 400));
    surface.add(new Vec2(710, 500));

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    body = box2d.createBody(bd);

    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < surface.size(); i++) {
      vertices[i] = new Vec2(box2d.coordPixelsToWorld(surface.get(i)));
    }

    ChainShape chain = new ChainShape();
    chain.createChain(vertices, vertices.length);

    FixtureDef fd = new FixtureDef();
    fd.shape = chain;
    fd.density = 1.2;
    fd.restitution = 1.6;
    fd.friction = 1.2;

    body.createFixture(fd);
  }

  void draw() {
    push();
    strokeWeight(2);
    stroke(255);
    noFill();
    beginShape();
    for (Vec2 v : surface) {
      vertex(v.x, v.y);
    }
    endShape();
    pop();
  }
}