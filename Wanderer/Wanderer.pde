//declare variables
//float x, y, velX, velY, diam;
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
  //pick initial random variables for velocity and acceleration
  vel = PVector.random2D();
  vel.mult(5);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  acc = PVector.random2D();
  acc.mult(.5);
  vel.limit(5);
  //add a random velocity of mult 10 to position and add a random acceleration of mult .1 to velocity

  loc.add(vel);
  vel.add(acc);

  //when the ball hits a wall an new random velocity and acceleration vector is selected
  if (loc.x >= width) {
    loc.x = 0;
  } else if (loc.x  <= 0) {
    loc.x = width;
  }
  if (loc.y >= height) {
    loc.y = 0;
  } else if (loc.y <= 0) {
    loc.y = height;
  }
}