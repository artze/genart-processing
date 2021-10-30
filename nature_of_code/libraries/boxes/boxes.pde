import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
Box2DProcessing box2d;

void setup() {
  size(800, 800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);
  boxes = new ArrayList<Box>();
}

void draw() {
  background(255);
  if (mousePressed) {
    Box box = new Box(mouseX, mouseY);
    boxes.add(box);
  }

  for (Box b: boxes) {
    b.draw();
  }

  box2d.step();
}
