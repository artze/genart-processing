import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Box> boxes;
Surface surface;
Boundary boundary;
Box2DProcessing box2d;
boolean rain = false;

void setup() {
  size(800, 800);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boxes = new ArrayList<Box>();
  surface = new Surface();
  boundary = new Boundary();
}

void draw() {
  background(0);
  surface.draw();
  boundary.draw();
  // if (mousePressed) {
  //   for (int i = 0; i < 10; i++) {
  //     Box box = new Box(mouseX, mouseY);
  //     boxes.add(box);
  //   }
  // }

  while (random(1) > 0.4 && rain) {
    for (int i = 0; i < 5; i++) {
      Box box = new Box(400, 50);
      boxes.add(box);
    }
  }

  for (Box b: boxes) {
    b.draw();
  }

  box2d.step();
  saveFrame("./output/####.png");
}

void mouseClicked() {
  rain = !rain;
  println(rain);
}