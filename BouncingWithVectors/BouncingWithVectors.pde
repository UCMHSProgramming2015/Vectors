//RED BLOOD CELLS...?
//declare variables
int quantity = 30;
float diam;
PVector[] loc = new PVector[quantity];
PVector[] vel = new PVector[quantity];

void setup() {
  //set size of canvas
  size(800, 600);
  noStroke();
  smooth();
  for (int i = 0; i < quantity; i++) {
    //initialize variables
    loc[i] = new PVector(width/2, height/2);
    vel[i] = new PVector(random(-5, 5), random(-5, 5));
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  diam = random(40);
  fill(150, 0, 0);

  for (int i = 0; i < quantity; i++) {
    //draw ball
    ellipse(loc[i].x, loc[i].y, diam, diam);

    //add velocity to position
    loc[i].add(vel[i]);

    //bounce ball if it hits walls
    if (loc[i].x + diam/2 >= width) {
      vel[i].x = -abs(vel[i].x);    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (loc[i].x - diam/2 <= 0) {
      vel[i].x = abs(vel[i].x);     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (loc[i].y + diam/2 >= height) {
      vel[i].y = -abs(vel[i].y);
    } else if (loc[i].y - diam/2 <= 0) {
      vel[i].y = abs(vel[i].y);
    }
  }
}