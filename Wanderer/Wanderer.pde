//declare variables
float diam;  //float loc. x,y
PVector loc; //replaces loc.x and loc.y

PVector vel = new PVector(2, 2);
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc= new PVector(width/2, height/2);
  //x = width/2;
  // y = height/2;
  diam = 80;
  //velX = random(-5, 5);
  //velY = random(-5, 5);
  vel = PVector.random2D();
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  //loc.x += vel.x;
  //loc.y += vel.y;
  loc.add(vel);

if (loc.x >= width) {  //allows ball to wander in the x direction
    loc.x = 0;
}
else if (loc.x <= 0) {  //allows ball to wander in the x direction
    loc.x = width;
}
if (loc.y >=height) {  //allows ball to wander in the y direction
      loc.y = 0;
}
else if (loc.y <= 0) {  //allows ball to wander in the y direction
  loc.y = height;
}
}