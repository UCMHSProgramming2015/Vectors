//declare variables
PVector loc;
PVector vel;
PVector acc;
float diam;

void setup() {
  //set size of canvas
  loc= new PVector(width/2,height/2);
  vel= PVector.random2D();
  acc= new PVector();
  size(900, 600);

  //initialize variables
  diam = 80;
  vel.x = random(-5, 5);
  vel.y = random(-5, 5);
}

void draw() {
  //draw background to cover previous frame
  //add acceleration to velocity and multiply it by a decimal to make it smaller
  background(0);
  acc=PVector.random2D();
  acc.mult(.4);
  vel.add(acc);
  //draw ball and add color
  fill(0,255,255);
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;

  //make ball ounce when it touches a side
  if (loc.x + diam/2 >= width) {
    vel.x = -vel.x;     
  } else if (loc.x - diam/2 <= 0) {
    vel.x = -vel.x ;
  }
  if (loc.y + diam/2 >= height) {
    vel.y = -vel.y;
  } else if (loc.y - diam/2 <= 0) {
    vel.y = -vel.y;
  }
}