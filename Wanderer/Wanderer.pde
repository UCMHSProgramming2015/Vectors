//declare variables
float diam;
PVector loc;
PVector vel;
PVector acc;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();
  vel.mult(4);
  acc = new PVector();
  diam = 80;
}

void draw() {
  //draw background to cover previous frame
  background(0);
  
  acc = PVector.random2D();
  acc.mult(0.1);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  
  //add acceleration to velocity
  vel.add(acc);
  vel.limit(10);

  //add velocity to position
  loc.add(vel);
  
  //random velocity vector every 2 seconds
  if (frameCount % 120 == 0) {
    vel = PVector.random2D();
    vel.mult(4);
  }

  //wrap the ball's position
  if (loc.x >= width) {
    loc.x = 0;
  } else if (loc.x <= 0) {
    loc.x = width;
  }
  if (loc.y >= height) {
    loc.y = 0;
  } else if (loc.y <= 0) {
    loc.y = height;
  }
}