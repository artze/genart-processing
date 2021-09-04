class Oscillator {
  PVector angle, velocity, amplitude;
  Oscillator() {
    angle = new PVector();
    velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    amplitude = new PVector(random(width / 2), random(height / 2));
  }

  void oscillate() {
    angle.add(velocity);
  }

  void draw() {
    pushMatrix();
    translate(width / 2, height / 2);
    oscillate();
    float x = amplitude.x * sin(angle.x);
    float y = amplitude.y * sin(angle.y);

    stroke(0);
    fill(175);
    // line(0, 0, x, y);
    circle(x, y, 20);
    popMatrix();
  }
}

Oscillator osc;

void setup() {
  size(800, 800);
  osc = new Oscillator();
}

void draw() {
  // background(255);
  osc.draw(); 
}

