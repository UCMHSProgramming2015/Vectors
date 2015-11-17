//declare variables
float diam;
PVector loc, vel, acc;

void setup() {
  //set size of canvas
  size(800, 600);
  
  colorMode(HSB, 360, 100, 100, 100);

  //initialize PVectors
  loc = new PVector(width/2, height/2);
  vel = new PVector(0,0);
  acc = PVector.random2D();
acc.mult(.1);


  diam = 80;
  noStroke();
}

void draw() {
  fill(frameCount%360, 60, 100);

  acc = PVector.random2D();
  
  //draw background to cover previous frame

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  
  //add acceleration to velocity
  vel.add(acc);
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