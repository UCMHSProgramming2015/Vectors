//declare variable
float diam;
//float x, y, vel.x, vel.y
PVector loc, vel;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  //x = width/2;
  //y = height/2;
  loc = new PVector(width/2,height/2);//intialzing loc. is the same as intializing x and y
  //vel.x = random(-5, 5);
  //vel.y = random(-5, 5);
  vel = new PVector(random(-5,5), random(-5,5));//intialzing vel. is the same as intializing vel.x and vel.y
}

void draw() {
  //draw background to cover previous frame
  background(0);
diam= 70;
  //draw ball using PVector as a location
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;

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