//declare variables
float diam;
PVector loc, vel, acc;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  
  diam = 50;
  loc = new PVector(400,300);
  vel = PVector.random2D();
  
}

void draw() {
  //draw background to cover previous frame
  background(0);
  
  acc = PVector.random2D();
  vel.add(acc);
  vel.limit(5);
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