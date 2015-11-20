//declare variables
//float x, y, velX, velY, diam;
float diam;

PVector loc, vel, acc;

void setup() {
  //set size of canvas
  size(800, 600);
    loc= new PVector(width/2, height/2);
  //initialize variables
  //x = width/2;
  //y = height/2;
  diam = 73;
  vel = PVector.random2D();
  //vel.mult(0);
  acc = PVector.random2D();
  acc.mult(.05);

  
}

void draw() {
  //draw background to cover previous frame
  background(19,24,51);
  
  //add here for ellipse to wander
  acc = PVector.random2D();
  acc.mult(.099);
  //draw ball
  vel.mult(1);
  
  ellipse(loc.x, loc.y, diam, diam);
  fill(232,239,144);
  vel.add(acc);
  vel.limit(15);  //limit v to avoid it from overcoming large velocities
  
  //add velocity to position
  loc.add(vel);

  //wrap the ball's position
  if (loc.x >= width) {
    loc.x = 0;
  } else if (loc.x <= 0) {
    loc.x = width ;
  }
  if (loc.y >= height) {
    loc.y = 0 ;
  } else if (loc.y <= 0) {
    loc.y = height ;
  }
}