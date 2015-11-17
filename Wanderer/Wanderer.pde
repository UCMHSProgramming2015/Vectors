//declare variables
float diam;
PVector loc, vel, a;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2,height/2);
  vel = PVector.random2D();
  diam = 80;
  a = PVector.random2D();
}

void draw() {
  //draw background to cover previous frame
  background(0);
a = PVector.random2D();
  //draw ball
  fill(random(255), random(255), random(255));
  ellipse(loc.x, loc.y, diam, diam);
  //add velocity to position
 loc.add(vel);
 vel.add(a);
 a.mult(0.2);
 vel.limit(5);
  //wrap the ball's position
  if (loc.x>= width) {
    loc.x = 0;     
  } else if (loc.x<= 0) {
    loc.x = width;
     vel.mult(1.1);
  }
  if (loc.y>= height) {
    loc.y = 0;
  } else if (loc.y<= 0) {
    loc.y = height;
  }
}