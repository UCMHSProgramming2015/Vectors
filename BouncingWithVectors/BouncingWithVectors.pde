//declare variables
int count = 100;
float[] diam = new float[count];
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for (int i = 0; i < count; i++) {
  loc[i] = new PVector(width/2, height/2);
  diam[i] = random(20,60);
  vel[i] = PVector.random2D();
  vel[i].mult(15);
  }
}

void draw() {
  //draw background to cover previous frame
  background(255,0,0);
  for (int i = 0; i < count; i++) {

  //draw ball
  fill(100,200,100);
  ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

  //add velocity to position
  //loc.x += vel.x;
  //loc.y += vel.y;
  loc[i].add(vel[i]);

  //bounce ball if it hits walls
  if (loc[i].x + diam[i]/2 >= width) {
    vel[i].x = -abs(vel[i].x);    //if the ball hits the right wall, assign x velocity the negative version of itself
  } else if (loc[i].x - diam[i]/2 <= 0) {
    vel[i].x = abs(vel[i].x);     //if the ball hits the left wall, assign x velocity the positive version of itself
  }
  if (loc[i].y + diam[i]/2 >= height) {
    vel[i].y = -abs(vel[i].y);
  } else if (loc[i].y - diam[i]/2 <= 0) {
    vel[i].y = abs(vel[i].y);
  }
}
}