class Surface {
  ArrayList<Vec2> surface;
  Body body;
  float angle, angleVel, widthVel, amplitude;

  Surface() {
    surface = new ArrayList<Vec2>();
    angle = 0;
    angleVel = 0.2;
    widthVel = 12;
    amplitude = 80;

    for (int i = 80; i < width - 80; i += widthVel) {
      surface.add(new Vec2(
        i,
        map(sin(angle), -1, 1, (height / 2) - amplitude, (height / 2) + amplitude) + 
          map(noise(angle), 0, 1, 10, 250)
      ));

      angle += angleVel;
    }

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
    fd.restitution = 0.5;
    fd.friction = 2;

    body.createFixture(fd);
  }

  void draw() {
    push();
    noStroke();
    noFill();
    beginShape();
    for (Vec2 v : surface) {
      vertex(v.x, v.y);
    }
    endShape();
    pop();
  }
}