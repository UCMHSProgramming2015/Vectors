//declare variables
int count = 30;
float[] diam = new float[count];
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] a = new PVector[count];

void setup() {
  //set size of canvas
  size(800, 600);
  for (int q = 0; q < count; q++) {
    background(0);
    //initialize variables
    loc[q] = new PVector(width/2, height/2);
    diam[q] = 10;
    vel[q] = new PVector(0, 0);
    a[q] = PVector.random2D();
    a[q].mult(.1);
  }
}

void draw() {
  //draw background to cover previous frame

  //draw ball
  for (int q = 0; q < count; q++) {
    fill(0,random(255),0);
    ellipse(loc[q].x, loc[q].y, diam[q], diam[q]);
    a[q] = PVector.random2D();
    a[q].mult(.1);
    //add velocity to position
    vel[q].add(a[q]);
    loc[q].add(vel[q]);
    vel[q].limit(10);

    //wrap the ball's position
    if (loc[q].x >= width) {
      loc[q].x = 0;
    } else if (loc[q].x <= 0) {
      loc[q].x = width;
    }
    if (loc[q].y >= height) {
      loc[q].y = 0;
    } else if (loc[q].y <= 0) {
      loc[q].y = height;
    }
  }
}