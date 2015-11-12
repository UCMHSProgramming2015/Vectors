//loc.add(x)
//declare variables
//float x, y, velX, velY, diam;

PVector loc; //loc replaces floats x and y
PVector vel; //vel replacs floats velX and velY
float diam;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  //x = width/2;
  //y = height/2;
  diam = 80;
  //velX = random(-5, 5);
  //velY = random(-5, 5);
  loc = new PVector(width/2,height/2); //initialize x and y location
  //vel = new PVector(random(-5,5),random(-5,5)); //initialize x and y velocity
  vel = PVector.random2D(); //creates random 2D vector with magnitude of 1
  vel.mult(5);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  //loc.x += vel.x;
  //loc.y += vel.y;
  //position.add(velocity);
  loc.add(vel);

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