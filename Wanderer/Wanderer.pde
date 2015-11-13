//declare variables
float diam;
PVector loc, vel;
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  diam = 80;
  loc = new PVector(random(diam/2, width - diam/2), random(diam/2, height - diam/2));
  vel = PVector.random2D();
  vel.mult(4);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.add(vel);

  //wrap the ball's position
  if (loc.x + diam/2 >= width) {
    loc.x = diam/2;     
  } else if (loc.x - diam/2 <= 0) {
    loc.x = width - diam/2;
  }
  if (loc.y + diam/2 >= height) {
    loc.y = diam/2;
  } else if (loc.y - diam/2 <= 0) {
    loc.y = height - diam/2;
  }
}