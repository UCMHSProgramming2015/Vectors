//declare variables
PVector loc;
PVector vel;
float diam;
PVector acc;


void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2, height/2);
  diam = 80;
  //pick initial random variables for velocity
  vel = PVector.random2D();
  vel.mult(5);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  //initialize acceleration to have a random magnitude of .5 EVERY frame
  acc = PVector.random2D(); 
  acc.mult(.5);
  //limit velocity to a magnitude of 5
  vel.limit(5);
  //add vel to loc and acc to vel
  loc.add(vel);
  vel.add(acc);

  //when a ball hits the wall it bounces off
  if (loc.x+diam/2 >= width) {
    vel.x*=-1;
  } else if (loc.x-diam/2  <= 0) {
    vel.x*=-1;
  }
  if (loc.y+diam/2 >= height) {
    vel.y*=-1;
  } else if (loc.y-diam/2 <= 0) {
    vel.y*=-1;
  }
}