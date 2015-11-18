//declare variables
float diam;
PVector loc;
PVector vel;
PVector a;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2, height/2);
  diam = 40;
  vel = new PVector(0, 0);
  a = PVector.random2D();
  a.mult(.1);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  fill(random(255),random(255),random(255));
  ellipse(loc.x, loc.y, diam, diam);
  a = PVector.random2D();
  a.mult(.1);
  //add velocity to position
  vel.add(a);
  loc.add(vel);
  vel.limit(10);

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