//----------GLOBAL VARIABLES----------//

int size = 3;
float radius = 10;
Charge p0 = new Charge(200., 100., 1., radius);
Charge p1 = new Charge(100., 50., -1., radius);
Charge p2 = new Charge(300., 300., 1., radius);
ArrayList<Charge> charges = new ArrayList<Charge>();
ArrayList<Force> forces = new ArrayList<Force>();




//----------PROCESSING METHODS----------//

void setup() {
  background(225);
  size(400, 400);
  ellipseMode(RADIUS);
  charges.add(p0);
  charges.add(p1);
  charges.add(p2);
}


void draw() {
  // Draw charges
  for (Charge p : charges) {
    p.show();
  }

  // Draw field arrows
  // Go through, and every X px(indicated by the resolution variable), calculate the net force and add it to the ArrayList of forces
  int res = 50;
  for (int x=res; x<width; x+=res) {
    for (int y=res; y<height; y+=res) {
      PVector forceVec = calcForce(x, y);
      Force f = new Force (forceVec, new PVector(x,y));
      drawArrow(x, y, forceVec.mag(), forceVec.heading());
      forces.add(f);
    }
  }
}


void mousePressed() {
  // Place a charge at this location 
  // Have a way to take inputs (take from calendar generator)
}



//----------EXTRA METHODS----------//

// Calculates the net force at the given (x,y) point and returns it as a PVector
// PVectors store x & y components of the total vector (with all vectors originating at 0,0)
PVector calcForce(int x, int y) {
  PVector netForce = new PVector(0, 0);
  for (Charge c : charges) {
    netForce.add(c.calcForce(x, y));
  }
  return netForce;
}

void drawArrow(float cx, float cy, float len, float angle) {
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0, 0, len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}
