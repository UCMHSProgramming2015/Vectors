//declare variables
float diam;
PVector loc;    //declare loc, replaces x and y
PVector vel;   //declare vel, replaces velx and vely

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
 loc = new PVector(width/2, height/2);
vel = PVector.random2D();  //random vector - speed of ball stays the same while direction changes 
vel.mult(10);  //multiply vector by 10 - random direction with magnitude of 10
diam = 80;
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);      //loc.x is the x component of loc

  //add velocity to position using vector addition - add vel vector to loc vector
  loc.add(vel);           

  //bounce ball if it hits walls
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