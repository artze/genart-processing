Spaceship s;

void setup() {
  size(1000,1000);
  s = new Spaceship();
}

void draw() {
  background(color(1, 26, 40));

  if (frameCount % 2 == 0) {
    s.shoot();
  }
  s.thrust();

  s.draw();

  saveFrame("./output/####.png");
}

// void keyPressed() {
//   if (keyCode == LEFT) {
//     s.turnLeft();
//   }
//   if (keyCode == RIGHT) {
//     s.turnRight();
//   }
//   if (keyCode == UP) {
//     s.thrust();
//   }
//   if (key == ' ') {
//     s.shoot();
//   }
// }