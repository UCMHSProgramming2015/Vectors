//declare variables
//float x, y, velX, velY, diam;
float diam;
PVector loc, vel, acc;



void setup() {
  //set size of canvas
  size(800, 600);
  background(0);
  colorMode(HSB, 360, 100, 100, 95);

  //initialize variables
  //x = width/2;
  //y = height/2;
  loc = new PVector(width/2,height/2);
  
  //velX = random(-5, 5);
  //velY = random(-5, 5);
  vel = PVector.random2D();
  vel.mult(1);
  acc = PVector.random2D();
  acc.mult(.01);
  
  diam = 80;
}



void draw() {
  fill(frameCount%360, 75, 85);
  //pick a random acceleration
  acc = PVector.random2D();
  acc.mult(.1);
  
  //draw background to cover previous frame
  //background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  
  //add acceleration to velocity
  vel.add(acc);
  
  //limit velocity to avoid being unable to overcome large velocity with small acceleration
  vel.limit(15);

  //add velocity to position
  //x += velX;
  //y += velY;
  loc.add(vel);

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