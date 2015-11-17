//declare variable
float diam;
//float x, y, vel.x, vel.y
PVector loc, vel, grav;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  //x = width/2;
  //y = height/2;
  loc = new PVector(width/2,height/2);//intialzing loc. is the same as intializing x and y
  //vel.x = random(-5, 5);
  //vel.y = random(-5, 5);
  vel = PVector.random2D();
  vel.mult(4);
  //grav. = .1
  grav = new PVector(0,.1);
}

void draw() {
  //draw background to cover previous frame
  background(0);
diam= 50;
  //draw ball using PVector as a location
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
 loc.add(vel);
 vel.add(grav);


  //bounce ball if it hits walls
  if (loc.x + diam/2 >= width) {
    vel.x = -abs(vel.x);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (loc.x - diam/2 <= 0) {
    vel.x = abs(vel.x);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (loc.y + diam/2 >= height) {
    vel.y = -abs(vel.y);
 
  }
}