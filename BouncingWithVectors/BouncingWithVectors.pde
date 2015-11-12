//declare variables
float diam;
PVector pos;
PVector vel;
PVector acc;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  pos = new PVector(width/2,height/2);
  diam = 80;
  vel = PVector.random2D();
  vel.mult(10);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(pos.x, pos.y, diam, diam);

  //add velocity to position
  pos.add(vel);
  acc= new PVector(-vel.y,vel.x);
  acc.mult(.01);
  vel.add(acc);
  //bounce ball if it hits walls
  if (pos.x + diam/2 >= width) {
    vel.x = -abs(vel.x);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (pos.x - diam/2 <= 0) {
    vel.x = abs(vel.x);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (pos.y + diam/2 >= height) {
    vel.y = -abs(vel.y);
  } else if (pos.y - diam/2 <= 0) {
    vel.y = abs(vel.y);

  }
}