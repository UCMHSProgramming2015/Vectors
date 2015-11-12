float diam;
PVector loc;
PVector vel;

void setup()
{
  size(800, 600);
  diam = 80;
  loc = new PVector (width/2,height/2);
  vel = PVector.random2D();
  vel.mult(5);
}

void draw() 
{
  background(0);
  noStroke();
  fill(random(255),random(255),random(255));
  ellipse(loc.x, loc.y, diam, diam);
  
  loc.add(vel);

  if (loc.x + diam/2 >= width)
  {
    vel.x = -abs(vel.x);    
  } else if (loc.x - diam/2 <= 0) {
    vel.x = abs(vel.x);    
  }
  if (loc.y + diam/2 >= height)
  {
    vel.y = -abs(vel.y);
  } else if (loc.y - diam/2 <= 0) {
    vel.y = abs(vel.y);
  }
}