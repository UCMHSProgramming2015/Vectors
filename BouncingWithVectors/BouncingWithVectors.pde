//declare variables
int count = 30;
float[] diam = new float[count];
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] gravity = new PVector[count];

void setup() {
  //set size of canvas
  size(800, 600);
  for (int i = 0; i < count; i++) {
    loc[i] = new PVector(width/2, height/2);
    diam[i] = random(5,30);
    vel[i] = new PVector(random(-2,2),random(-2,2));
    vel[i].mult(5);
    gravity[i] = new PVector(0,1);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < count; i++) {
    //draw ball
    fill(random(255),random(255),random(255));
    ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

    //add velocity to position
    //loc.x += vel.x;
    //loc.y += vel.y;
    vel[i].add(gravity[i]);
    loc[i].add(vel[i]);

    //bounce ball if it hits walls
    if (loc[i].x + diam[i]/2 >= width) {
      vel[i].x = -abs(vel[i].x);
    } else if (loc[i].x - diam[i]/2 <= 0) {
      vel[i].x = abs(vel[i].x);
    }
    if (loc[i].y + diam[i]/2 >= height) {
      vel[i].y = -abs(vel[i].y);
    } else if (loc[i].y - diam[i]/2 <= 0) {
      vel[i].y = abs(vel[i].y);
    }
  }
}