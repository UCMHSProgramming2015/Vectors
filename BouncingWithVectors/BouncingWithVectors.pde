//declare variables
float diam;
int count = 30;
//float loc.x,loc.y
PVector [] loc= new PVector [count]; //replaces loc.x and loc.y

//float vel.loc.x, vel.loc.y
PVector [] vel= new PVector [count]; //replces vel.loc.x and vel.loc.y


void setup() {
  //set size of canvas
  size(800, 600);
  for (int i = 0; i < count; i++) {
  //initialize variables
  // loc.x = width/2;
  //loc.y = height/2;
  loc[i]= new PVector(width/2, height/2);
  diam = 80;
  //vel.loc.x = random(-5, 5);
  //vel.loc.y = random(-5, 5);
  vel[i] = PVector.random2D();
}
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for (int i = 0; i < count; i++) {
  //draw ball
  ellipse(loc[i].x, loc[i].y, diam, diam);

  //add velocity to position
  //loc.x += vel.x;
  //loc.y += vel.y;
  loc[i].add(vel[i]);

  //bounce ball if it hits walls
  if (loc[i].x + diam/2 >= width) {
    vel[i].x = -abs(vel[i].x);    //if the ball hits the right wall, assign loc.x velocitloc.y the negative version of itself
  } else if (loc[i].x - diam/2 <= 0) {
    vel[i].x = abs(vel[i].x);     //if the ball hits the left wall, assign loc.x velocitloc.y the positive version of itself
  }
  if (loc[i].y + diam/2 >= height) {
    vel[i].y = -abs(vel[i].y);
  } else if (loc[i].y - diam/2 <= 0) {
    vel[i].y = abs(vel[i].y);
  }
}
}