//declare variables

//float location vector
PVector loc;

//float velocity vector
PVector vel;

//float diameter
float diam;

void setup() {
  
  //set size of canvas
  size(800, 600);

  //initialize vectors
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();  //creates random velocity with a magnitude of 1
  vel.mult(7);  //makes the magnitude 7
  
  //initialize diameter
  diam = 80;
  
 }

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
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