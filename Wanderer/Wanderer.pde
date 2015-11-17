//declare variables
float diam;

int count = 4;
float[] wanderers = new float[count];
PVector[] vel = new PVector[count];
PVector[] loc = new PVector[count];
PVector[] acc = new PVector[count];
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables

  diam = 30;
  for (int i = 0; i< count; i++) {
    loc[i] = new PVector(400, 300);
    vel[i] = PVector.random2D();
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  noStroke();
  for (int i = 0; i< count; i++) {
    acc[i] = PVector.random2D();
    vel[i].add(acc[i].mult(.5));
    vel[i].limit(4);
    //draw ball
    ellipse(loc[i].x, loc[i].y, diam, diam);

    //add velocitloc.yto position
    loc[i].x+= vel[i].x;
    loc[i].y+= vel[i].y;

    //wrap the ball's position
    if (loc[i].x>= width) {
      loc[i].x= 0;
    } else if (loc[i].x <= 0) {
      loc[i].x= width ;
    }
    if (loc[i].y >= height) {
      loc[i].y= 0;
    } else if (loc[i].y <= 0) {
      loc[i].y= height ;
    }
  }
}