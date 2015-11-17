//declare variables
float diam;
PVector loc;
PVector vel;
void setup() {
  //set size of canvas
  size(800, 600);
  //initialize variables
  loc = new PVector(width/2, height/2);
  diam = 80;
  vel = new PVector(random(5,5), random(5, 5));
  colorMode(HSB, 800, 600, 100);
}

void draw() {
  //draw background to cover previous frame
  background(0);
  //add color to ball
  fill(loc.x, loc.y, 100);
  
  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;

  //wrap the ball's position
  if (loc.x + diam/2 >= width) {
    vel.x = -abs(vel.x);     
  } else if (loc.x - diam/2 <= 0) {
    vel.x = abs(vel.x);
  }
  if (loc.y + diam/2 >= height) {
    vel.y = -abs(vel.y);
  } else if (loc.y - diam/2 <= 0) {
    vel.y = abs(vel.y);
  }
}