int woof = 40;
float[] diam = new float[woof];
PVector[] loc = new PVector[woof];
PVector[] vel = new PVector[woof];
PVector[] accel = new PVector[woof];

void setup() {
  size(800, 600);
  background(0);
for(int i = 0;i < woof; i++)
  {
    diam[i] = 5;
    loc[i] = new PVector (width/2,height/2);
    vel[i] = PVector.random2D();
    vel[i].mult(0);
    accel[i] = PVector.random2D();
    accel[i].mult(0.1);
  }
}

void draw() {
 for(int i = 0;i < woof; i++)
{
  strokeWeight(1);
  stroke(random(255),random(255),random(255));
  fill(0);
  ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);
  
  accel[i] = PVector.random2D();
  accel[i].mult(0.1);
  
  vel[i].add(accel[i]);
  vel[i].limit(5);
  loc[i].add(vel[i]);

  if (loc[i].x >= width) {
    loc[i].x = 0;     
  } else if (loc[i].x <= 0) {
    loc[i].x = width;
  }
  if (loc[i].y >= height) {
    loc[i].y = 0;
  } else if (loc[i].y <= 0) {
    loc[i].y = height;
  }
}
}