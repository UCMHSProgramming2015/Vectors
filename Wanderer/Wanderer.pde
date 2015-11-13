//declare variables
float diam;
PVector loc, vel, grav;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2,height/2);//intialzing loc. is the same as intializing x and y
  diam = 80;
  vel = PVector.random2D();
    vel.mult(4);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x,loc.y, diam, diam);

  //add velocity to position
 loc.add(vel);

  //wrap the ball's position
  if (loc.x >= width) {
    loc.x = 0;     
  } else if (loc.x <= 0) {
    loc.x = width;
  }
  if (loc.y >= height) {
    loc.y = 0;
  } else if (loc.y <= 0) {
    loc.y = height; 
  }
}