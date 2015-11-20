//declare variables
float diam;
PVector loc, vel, acc;

void setup() {
  background(100, 40, 30);
  //set size of canvas
  size(800, 600);

  //initialize variables

  diam = 50;
  loc = new PVector (width/2, height/2);
  vel = PVector.random2D();
  vel.mult(.1);
  acc = PVector.random2D();
  acc.mult(.01);
}

void draw() {
  //random acceleration
  acc = PVector.random2D();
  acc.mult(.1);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.add(vel);

  //add acceleration to velocity
  vel.add(acc);

  //limit velocity 
  vel.limit(5);


  //wrap the ball's position
  if (loc.x >= width) {
    loc.x = 0;
  } else if (loc.x  <= 0) {
    loc.x = width ;
  }
  if (loc.y >= height) {
    loc.y = 0;
  } else if (loc.y <= 0) {
    loc.y = height ;
  }
}