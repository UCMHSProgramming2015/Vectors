//declare variables
float diam;  //float loc.x,y
PVector loc, acc, vel;  //replaces loc.x and y
//float vel.loc.x,vely.y


void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2,height/2);
  
  diam = 80;
  //velX = random(-5, 5);
  //velY = random(-5, 5);
  vel = PVector.random2D();
  vel.mult(1);
  acc = PVector.random2D();
  acc.mult(.1);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
    vel.add(acc);
    vel.limit(5);
  //add velocity to position
  //loc.x += vel.x;
  //loc.y += vel.y;
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