//declare variables
float diam, c;
PVector loc;
PVector vel;
PVector a;
void setup() {
  //set size of canvas
  size(800, 600);
 vel.limit (70);
  //initialize variables
  loc= new PVector(width/2, height/2);
  diam = 18;
  vel = new PVector (random(-2, 2), random(-2, 2));
  a = new PVector (random(-12, 5), random(-5, 12));
  c=0;
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  ellipse(loc.x, loc.y/2, diam, diam);
  ellipse(loc.x, loc.y, diam, diam);
  ellipse(loc.x*2, loc.y, diam, diam);
  ellipse(loc.x, loc.y*2, diam, diam);
  ellipse(loc.x*2, loc.y*2, diam, diam);
  if (true) {
    c=c+1;
  }
  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;
  if (c>=30) { 
    c=0;
    vel= vel.add (a);
    vel= vel.add (a);
  }
  //wrap the ball's position
  if (loc.x  >= width) {
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