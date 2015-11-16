int woof = 30;
float[] diam = new float[woof];
PVector[] loc = new PVector[woof];
PVector[] vel = new PVector[woof];

void setup()
{
  size(800, 600);
  for(int i = 0;i < woof; i++)
  {
    diam[i] = 80;
    loc[i] = new PVector (width/2,height/2);
    vel[i] = new PVector (random(-5,5),random(-5,5));
  }
}

void draw() 
{
  background(0);
  for(int i = 0;i < woof; i++)
{
  noStroke();
  fill(random(255),random(255),random(255));
  ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);
  
  loc[i].add(vel[i]);

  if (loc[i].x + diam[i]/2 >= width)
  {
    vel[i].x = -abs(vel[i].x);    
  } else if (loc[i].x - diam[i]/2 <= 0) {
    vel[i].x = abs(vel[i].x);    
  }
  if (loc[i].y + diam[i]/2 >= height)
  {
    vel[i].y = -abs(vel[i].y);
  } else if (loc[i].y - diam[i]/2 <= 0) {
    vel[i].y = abs(vel[i].y);
  }
}
}