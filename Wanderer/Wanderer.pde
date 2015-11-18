//declare variables
float diam;  //float loc. x,y
PVector loc, acc, vel; //replaces loc.x and loc.y

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2, height/2);


  //x = width/2;
  // y = height/2;
  diam = 80;
  //velX = random(-5, 5);
  //velY = random(-5, 5);
  vel = new PVector(4, 7);
  vel.mult(1);
  acc = PVector.random2D();
  acc.mult(.1);
}

void draw() {
  //draw background to cover previous frame
  background(0, 135, 220);

  //draw ball
  fill(0);
  ellipse(loc.x, loc.y, diam, diam);
  vel.add(acc);
  vel.limit(2);
  //add velocity to position
  //loc.x += vel.x;
  //loc.y += vel.y;
  loc.add(vel);

  if (loc.x >= width) {  //allows ball to wander in the x direction
    loc.x = 0;
  } else if (loc.x <= 0) {  //allows ball to wander in the x direction
    loc.x = width;
  }
  if (loc.y >=height) {  //allows ball to wander in the y direction
    loc.y = 0;
  } else if (loc.y <= 0) {  //allows ball to wander in the y direction
    loc.y = height;
  }
}