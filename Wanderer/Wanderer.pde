//declare variables
float diam;
PVector loc, vel;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  
  diam = 80;
  loc = new PVector(400,300);
  vel = PVector.random2D();
  vel.mult(7);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocitloc.yto position
  loc.x+= vel.x;
  loc.y+= vel.y;

  //wrap the ball's position
  if (loc.x>= width) {
    loc.x= 0;     
  } else if (loc.x <= 0) {
    loc.x= width ;
  }
  if (loc.y >= height) {
    loc.y= 0;
  } else if (loc.y <= 0) {
    loc.y= height ;
  }
}