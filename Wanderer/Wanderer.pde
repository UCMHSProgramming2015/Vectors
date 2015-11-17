//declare variables
float diam;
PVector loc, vel, acc;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize PVectors
  loc = new PVector(width/2, height/2);
  vel = new PVector (0,0);
 acc = PVector.random2D();
 acc.mult(0.1);
 diam = 80;
}

void draw() {

  acc = PVector.random2D();
  
  //draw background to cover previous frame
  //background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  
//multiply acc by 0.1
acc.mult(0.1);

//add acc to vel
vel.add(acc);

//magnitude of vel cannot be greater than 1
vel.limit(1);

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