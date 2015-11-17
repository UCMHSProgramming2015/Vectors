//declare variables
float diam;
PImage bg;
PVector loc;
PVector vel;

void setup() {
  //set size of canvas
  size(800, 600);
  //initialize variables
  loc = new PVector(width/2, height/2);
  diam = 80;
  vel = PVector.random2D(); //random direction vector
  vel.mult(10); //create vector with multiple of 10
  colorMode(HSB,800,600,10);
  bg = loadImage("bg.png");
}

void draw() {
  //draw background to cover previous frame
  background(bg);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add color to ball
  fill(loc.x, loc.y,10);

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