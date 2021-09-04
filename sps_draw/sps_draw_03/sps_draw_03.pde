Spaceship s1;
Spaceship s2;

void setup() {
  size(1000,1000); 
  s1 = new Spaceship("right");
  s2 = new Spaceship("left");
}

void draw() {
  background(color(1, 26, 40));
  s1.draw();
  s2.draw();

  saveFrame("./output/####.png");
}
