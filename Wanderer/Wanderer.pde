//declare variables
float diam;
PVector loc;
PVector vel;
PVector acc;

void setup() {
  //set size of canvas
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  //initialize variables
  loc = new PVector (width/2, height/2);
  vel = new PVector( 5, 3);
  vel.mult(0);
  acc = PVector.random2D();
  acc.mult(.1);

  diam = 80;
}

void draw() {
  //draw background to cover previous frame
  //background(0);
  fill (frameCount%360, 20, 100);
  stroke(frameCount%360, 80, 100);
  acc = PVector.random2D();
  acc.mult(.1);


  //draw ball
  ellipse(loc.x, loc.y, diam, diam);


  //add velocity to position
  vel.add(acc);
  vel.limit(1);
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