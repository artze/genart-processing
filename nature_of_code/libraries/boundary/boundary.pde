import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
Boundary boundary;
Box2DProcessing box2d;

void setup() {
  size(800, 800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boxes = new ArrayList<Box>();
  boundary = new Boundary(3 * width / 4, 600, width / 2, 20);
}

void draw() {
  background(0);
  boundary.draw();
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
