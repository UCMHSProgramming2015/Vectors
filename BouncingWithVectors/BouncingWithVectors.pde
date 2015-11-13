//declare variables
float diam;
PVector loc, vel;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  diam = 80;
  loc = new PVector(width/2, height/2);
  vel = new PVector(random(-5,5), random(-5,5));
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.add(vel);

  //bounce ball if it hits walls
  if (loc.x + diam/2 >= width || loc.x - diam/2 <= 0) {
    vel.x *= -1;    //if the ball hits the side, assign the x velocity the opposite version
  }
  if (loc.y + diam/2 >= height || loc.y - diam/2 <= 0) {
    vel.y *= -1;
  }
}