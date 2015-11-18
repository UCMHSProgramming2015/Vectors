//declare variables
float diam;
PVector loc, vel, acc;

void setup() {
  //set size of canvas
  size(800, 600);
  noStroke();
  //initialize variables
  //x = width/2;
  //y = height/2;
  diam = 80;
  loc = new PVector(width/2,height/2);
  vel = PVector.random2D();
  vel.mult(1);
  acc = PVector.random2D();
  acc.mult(.02);
}

void draw() {
  //draw background to cover previous frame
  acc = PVector.random2D();
  acc.mult(.1);
  fill(random(255),random(255),random(255));
  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
// add acceleration to velocity
  vel.add(acc);
  vel.limit(20);
  //add velocity to position
  loc.add(vel);
  //loc.x += vel.x;
  //loc.y += vel.y;


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