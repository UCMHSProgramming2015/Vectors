//declare variables
float diam;

//create vectors
//replaces float x,y
PVector loc;
//replacs velX,velY
PVector vel;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables

  //give the vectors values
  //replaces initializing x = width/2 and y = height/2;
  //**vector name=new PVector(x value,y value)**

  loc=new PVector(width/2, height/2);

  //replaces  velX = random(-5, 5); velY = random(-5, 5);
  vel=new PVector(random(5, -5), random(-5, 5));

  diam = 80;
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //**to refer to values in vector use loc.x and loc.y**

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  //x += velX;
  //y += velY;
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