//declare variables
PVector loc;
PVector vel;
PVector acc;
float diam;
int i;

void setup() {
  //set size of canvas
  size(800, 600);
  i = 0;
  
  //initialize variables
  diam = 80;
  loc = new PVector(width/2, height/2); 
  vel = new PVector(0, 0);
  acc = PVector.random2D();
  acc.mult(.01);
 
  colorMode(HSB, 255);
}

void draw() {
  //draw background to cover previous frame
  acc = PVector.random2D();
  acc.mult(1);
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  fill(i, 255, 200);
  i = i + 1;

  //add velocity to position
  loc.add(vel);
  
  //add acceleration to velocity
  vel.add(acc);
  

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
  if (i > 255) {
    i = 0;
  }
}