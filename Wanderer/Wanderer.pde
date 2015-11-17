//declare variables
float diam;
PVector loc, vel, acc;

void setup() {
  //set size of canvas
  size(800, 600);
  diam = 80;

  loc = new PVector(width/2, height/2);
  vel = new PVector(0,0);
  vel.mult(1);
  acc = PVector.random2D();
  acc.mult(0.01);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
loc.add(vel);
vel.add(acc);

  if (loc.x + diam/2 >= width) {
    vel.x = -abs(vel.x);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (loc.x - diam/2 <= 0) {
    vel.x = abs(vel.x);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (loc.y + diam/2 >= height) {
    vel.y = -abs(vel.y);
  } else if (loc.y - diam/2 <= 0) {
    vel.y = abs(vel.y);
  }
  
}