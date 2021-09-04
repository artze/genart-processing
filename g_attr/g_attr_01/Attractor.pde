class Attractor {
  PVector location;
  float mass;
  
  Attractor() {
    location = new PVector(random(0, width), random(0, height));
    mass = random(30, 50);
  }
  
  PVector getAttractiveForce(Mover m) {
    PVector attractorToMover = PVector.sub(location, m.location);
    float distance = attractorToMover.mag();
    distance = constrain(distance, 2, 30);
    PVector attractiveForceDirection = attractorToMover.get().normalize();
    float attractiveForceMag = mass * m.mass / sq(distance);
    
    return attractiveForceDirection.mult(attractiveForceMag);
  }
  
  void draw() {
    noStroke();
    fill(250);
    // circle(location.x, location.y, mass * 2);
  }
}