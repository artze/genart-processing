import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
Surface surface;
Box2DProcessing box2d;

void setup() {
  size(800, 800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boxes = new ArrayList<Box>();
  surface = new Surface();
}

void draw() {
  background(0);
  surface.draw();
  if (mousePressed) {
    Box box = new Box(mouseX, mouseY);
    boxes.add(box);
  }

  for (Box b: boxes) {
    b.draw();
  }

  box2d.step();
  // saveFrame("./output/####.png");
}
