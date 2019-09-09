class Charge {
  float x, y, charge, radius;

  Charge(float x, float y, float charge, float radius) {
    this.x = x;
    this.y = y;
    this.charge = charge;
    this.radius = radius;
  } 

  // Draws this Charge
  void show() {
    // If positive, draw the charge as red, otherwise draw it as black
    stroke(0);
    fill(0);   
    if (charge > 0) {
      fill(255, 0, 0);
    }
    ellipse(x, y, radius, radius);
  }

  // Calculate the force this Charge would exert on a small positive point charge at the given x,y coordinate
  // Effectively calculates the field strength
  PVector calcForce(int x, int y) {
    return new PVector();
  }
}
