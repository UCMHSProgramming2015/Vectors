//declare variables
PVector loc;
PVector vel = PVector.random2D();
int diam = 80;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize location
  loc = new PVector(width/2, height/2);
  vel.mult(10);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;

  //wrap the ball's position
  if (loc.x > width) {
    loc.x = 0;
  } else if (loc.x < 0) {
    loc.x = width;
  }
  if (loc.y > height) {
    loc.y = 0;
  } else if (loc.y < 0) {
    loc.y = height;
  }
}