//declare variables
float diam;
PVector loc;
PVector vel;
PVector acc;

void setup() {
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
  //set size of canvas
  size(800, 600);
  loc=new PVector(width/2, height/2);
  //initialize variables
  //x = width/2;
  //y = height/2;
  diam = 80;
  //define velocity
  vel = PVector.random2D();
  vel.mult(1);
  //define acceleration
  acc= PVector.random2D();
  acc.mult(.09);
}

void draw() {
  //draw background to cover previous frame
  background(255);

  //draw ball
  fill(frameCount%360, 70, 80);
  ellipse(loc.x, loc.y, diam, diam);
  vel.add(acc); //add acceleration to velocity
  vel.limit(30); //limit max velocity of ball
  acc= PVector.random2D();
  acc.mult(.09);

  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;

  //wrap the ball's position
  if (loc.x >= width) {
    loc.x = 0;
  } else if (loc.x  <= 0) {
    loc.x = width ;
  }
  if (loc.y >= height) {
    loc.y = 0;
  } else if (loc.y  <= 0) {
    loc.y = height ;
  }
}