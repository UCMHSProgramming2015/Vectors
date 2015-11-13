//declare variables
float diam;
PVector loc, vel;

void setup() {
  //set size of canvas
  size(800, 600, P3D);

  //initialize variables
  diam = 80;
  loc = new PVector(width/2, height/2, 0);
  vel = new PVector(random(-10,10), random(-10,10), 0);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  pushMatrix();
  translate(loc.x,loc.y,loc.z);
  sphere(diam);
  popMatrix();

  //add velocity to position
  loc.add(vel);

  //bounce ball if it hits walls
  if (loc.x + diam/2 >= width || loc.x - diam/2 <= 0) {
    vel.x *= -1;    //if the ball hits the side, assign the x velocity the opposite version
  }
  if (loc.y + diam/2 >= height || loc.y - diam/2 <= 0) {
    vel.y *= -1;
  }
  if (loc.z - diam/2 <= -sqrt(sq(width)+sq(height))/2) {
    vel.z *= -1;
  } else {
    vel.z -= 1;
  }
}