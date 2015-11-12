//declare variables
float diam;

PVector loc; //vector?
PVector v;
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2, height/2); //initialize x, y
  diam = 80; //diameter
  v = PVector.random2D(); //velocity
  v.mult(5);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.add(v);
  //bounce ball if it hits walls
  if (loc.x + diam/2 >= width) {
    v.x = -abs(v.x);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (loc.x - diam/2 <= 0) {
    v.x = abs(v.x);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (loc.y + diam/2 >= height) {
    v.y = -abs(v.y);
  } else if (loc.y - diam/2 <= 0) {
    v.y = abs(v.y);
  }
}