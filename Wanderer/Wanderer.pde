//declare variables
float diam;
PVector loc, vel;
int m = millis();

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2,height/2); //initialize loc. replaces initialization of x and y
  
  diam = 80;
  
  //create a random 2D vector
  vel = PVector.random2D();
  vel.mult(random(3));
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //change vel every two seconds
  if (frameCount % 120 == 0){
    vel = PVector.random2D();
    vel.mult(random(3));
  }

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