//declare variables
float diam;
PVector loc;
PVector vel;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  //x = width/2;
  //y = height/2;
  diam = 80;
  loc = new PVector(width/2,height/2);
  vel = new PVector(random (-7,7),random(-7,7));
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