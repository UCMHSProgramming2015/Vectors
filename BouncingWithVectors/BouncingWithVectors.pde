//declare variables
float diam;
PVector vel; //replaces float velX, velY
PVector loc; //replaces float x,y

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  diam = 80;
  loc = new PVector(width/2,height/2);
  //vel = new PVector(random(-5,5),random(-5,5));
  vel = PVector.random2D();    // creating random 2d vecotr @1
  vel.mult(5);
}

void draw() {
  //draw background to cover previous frame
  background(255,frameCount%360,250);

  //draw ball
  noStroke();
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.add(vel);

  //bounce ball if it hits walls
  if (loc.x + diam/2 >= width) {
    vel.x = -abs(vel.x);    //if the ball hits the right wall, assign loc.x velocity the negative version of itself
  } else if (loc.x - diam/2 <= 0) {
    vel.x = abs(vel.x);     //if the ball hits the left wall, assign loc.x velocity the positive version of itself
  }
  if (loc.y + diam/2 >= height) {
    vel.y = -abs(vel.y);
  } else if (loc.y - diam/2 <= 0) {
    vel.y = abs(vel.y);
  }
}