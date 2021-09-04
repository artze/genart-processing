// ==============================================
// Ball accelerates randomly or with perlin noise
// ==============================================
// class Ball {
//   PVector location;
//   PVector velocity;
//   PVector acceleration;
//   float xOff;

//   Ball() {
//     location = new PVector(width / 2, height / 2);
//     velocity = new PVector(0, 0);
//     xOff = 0;
//   }

//   void update() {
//     acceleration = new PVector(
//       map(noise(xOff), 0, 1, -1, 1),
//       map(noise(xOff + 1000), 0, 1, -1, 1)
//     );
//     // acceleration = PVector.random2D();
//     velocity.add(acceleration);
//     velocity.limit(10);
//     location.add(velocity);
//     xOff += 0.1;
//   }

//   void checkEdges() {
//     if (location.x > width) {
//       location.x = 0;
//     } else if (location.x < 0) {
//       location.x = width;
//     }
//     if (location.y > height) {
//       location.y = 0;
//     } else if (location.y < 0) {
//       location.y = height;
//     }
//   }

//   void draw() {
//     circle(location.x, location.y, 80);
//   }
// }

// ================================================
// Follows mouse with increased acceleration as it
// approaches mouse
// ================================================
class RectBox {
  PVector location;
  PVector velocity;
  PVector acceleration;

  RectBox() {
    location = new PVector(width / 2, height / 2);
    velocity = new PVector(0, 0);
  }

  void update() {
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, location);
    float distance = dir.mag();

    acceleration = dir;
    acceleration.normalize();
    // acceleration.mult(
    //   1000 /
    //   pow(1.3, distance / 15)
    // );
    acceleration.mult(
      2 /
      map(distance, 0, 800, 1, 10)
    );

    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }

  void draw() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(atan2(velocity.y,velocity.x));
    rectMode(CENTER);
    rect(0, 0, 80, 10);
    popMatrix();
  }
}

RectBox b;
void setup() {
  size(1000, 1000);
  b = new RectBox();
}

void draw() {
  // background(#dddddd);
  b.update();
  b.checkEdges();
  b.draw();
}