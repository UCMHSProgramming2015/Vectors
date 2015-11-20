//declare variables
//float x, y, velX, velY, 
float diam;
PVector loc;
PVector vel;

PVector acc;


void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables

  // x = width/2;
  //y = height/2;
  //velX = random(-5, 5);
  // velY = random(-5, 5);
  //vel = PVector.random2D();
  //vel.mult(0);
  loc = new PVector (width/2, height/2);
  diam = 80;
  vel = PVector.random2D();
  vel.mult(1);
  acc =PVector.random2D();
  acc.mult(.01);

  //draw background to cover previous frame
  background(0);

  //draw ball

  colorMode(HSB, 360, 100, 100, 100);
  noStroke();
}


void draw() {
  fill(frameCount%360, 70, 80);
  ellipse(loc.x, loc.y, diam, diam);
  //add acc to velocity
  vel.add(acc);    
  vel.limit(5);
  loc.add(vel);

  //add velocity to position

  // x += velX;
  // y += velY;


  //wrap the ball's position
  if (loc.x >= width) {
    loc.x = 0;
  } else if (loc.x <= 0) {
    loc.x = width;
  }
  if (loc.y >= height) {
    loc.y = 0;
  } else if (loc.y  <= 0) {
    loc.y = height;
  }
}