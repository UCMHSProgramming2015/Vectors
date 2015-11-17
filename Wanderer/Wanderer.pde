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
  diam = 80;
  vel = PVector.random2D();
  acc = new PVector();
  acc.mult(10);
}

void draw() {
  //draw background to cover previous frame
  background(0);
acc = PVector.random2D();
  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
//add acc to vel
vel.add(acc);
  //add velocity to position
loc.add(vel);

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