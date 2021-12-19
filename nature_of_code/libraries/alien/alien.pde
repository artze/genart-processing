import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<Alien> aliens;
Boundary boundary1;
Boundary boundary2;

void setup() {
  size(1000, 1000);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  aliens = new ArrayList<Alien>();
  boundary1 = new Boundary(3 * width / 4, 600, width / 2, 20);
  boundary2 = new Boundary(width / 4, 900, width / 2, 20);
}

void draw() {
  background(0);
  boundary1.draw();
  boundary2.draw();
  if (mousePressed) {
    Alien alien = new Alien(mouseX, mouseY);
    aliens.add(alien);
  }
  
  for (Alien a: aliens) {
    a.draw();
  }

  box2d.step();
  // saveFrame("./output/####.png");
}
