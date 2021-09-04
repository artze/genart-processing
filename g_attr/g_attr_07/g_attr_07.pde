Mover[] moverArr = new Mover[8000];
Attractor[] attractorArr = new Attractor[2];
float xoff = 0;

void setup() {
  size(1024, 1024);
  frameRate(30);
  attractorArr[0] = new Attractor(new PVector(width / 4, height / 5 * 4));
  attractorArr[1] = new Attractor(new PVector(width / 4, height / 5));
  PVector center = new PVector(width / 2, height / 2);
  for (int i = 0; i < moverArr.length; i++) {
    moverArr[i] = new Mover(
      random(0.5, 3),
      random(0, width),
      random(0, height)
    );
  }
};

void draw() {
  background(color(#040408));
  for (Attractor a : attractorArr) {
    a.update();
    a.draw();
  }
  PVector distort = new PVector(0, 0);

  if (random(0, 1) > 0.9)  {
    float vectorMag = map(noise(xoff), 0, 1, -300, 200);
    distort.add(new PVector(vectorMag, vectorMag * (random(1, 1.5))));
  }

  for (Mover m : moverArr) {
    for (Attractor a : attractorArr) {
      m.applyForce(a.getAttractiveForce(m));
      m.applyForce(distort);
    }
    m.update();
    m.draw();
  }

  xoff += 0.2;
  // saveFrame("./output/####.png");
};