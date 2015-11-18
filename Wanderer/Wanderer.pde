//declare variables
float diam;
PVector loc;
PVector vel;
PVector acc;

void setup() {
  //set size of canvas
  size(800, 600);
  background(0);

  //initialize variables
  loc = new PVector(width/2, height/2);
  diam = 80;
  vel = PVector.random2D();
  vel.mult(0);
  acc = PVector.random2D();
  acc.mult(5);
  fill(random(255),random(255),random(255));
}

void draw() {
  //draw background to cover previous frame


  //draw ball;
  ellipse(loc.x, loc.y, diam, diam);
  acc = PVector.random2D();
  acc.mult(5);
  //add velocity to position
  loc.add(vel);
  vel.add(acc);
  vel.limit(5);

  //wrap the ball's position
  if (loc.x >= width) {
    loc.x = 0;    
    fill(random(255), random(255), random(255));
  } else if (loc.x <= 0) {
    loc.x = width;
    fill(random(255), random(255), random(255));
  }
  if (loc.y >= height) {
    loc.y = 0;
    fill(random(255), random(255), random(255));
  } else if (loc.y <= 0) {
    loc.y = height;
    fill(random(255), random(255), random(255));
  }
}