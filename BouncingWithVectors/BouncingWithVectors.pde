//declare variables
float diam;
//float x,y
PVector loc;//replaces x and y
PVector vel; //vel replaces velX and velY


void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
   //x = width/2
   //y = height/2
  loc = new PVector(width/2, height/2);
  diam = 80;
  //velx = random(-5,5);
  //vely = random(-5,5);
  //vel = new PVector(random(-5,5),random(-5,5));//initialize velocity
  vel = PVector.random2D();//creates random 2D vector with a magnitude of 1
}
void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  //loc.x += vel.x;
  //loc.y += vel.y;
loc.add(vel);//add vel to loc
  //bounce ball if it hits walls
  if (loc.x + diam/2 >= width) {
    vel.x = -abs(vel.x);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (loc.x - diam/2 <= 0) {
    vel.x = abs(vel.x);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (loc.y + diam/2 >= height) {
    vel.y = -abs(vel.y);
  } else if (loc.y - diam/2 <= 0) {
    vel.y = abs(vel.y);
  }
}