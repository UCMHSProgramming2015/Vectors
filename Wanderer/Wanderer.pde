//declare variables
float diam;
PVector loc, vel, acc;
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  diam = 60;
  loc = new PVector(random(diam/2, width - diam/2), random(diam/2, height - diam/2));
  vel = PVector.random2D();
  vel.mult(4);
}

void draw() {
  //draw background to cover previous frame with a blue color proportional to location
  background(0, 0, map(loc.mag(), 0, 1000, 0, 255));

  //draw ball with a red color proportional to velocity and a diameter inversely proportional to velocity
  fill(map(vel.mag(), 0, 6, 0, 255), 0, 0);
  diam = map(vel.mag(), 0, 6, 120, 30);
  ellipse(loc.x, loc.y, diam, diam);

  //randomize acceleration
  acc = PVector.random2D();
  acc.mult(0.25);

  //add acceleration to velocity
  vel.add(acc);
  vel.limit(6);

  //add velocity to position
  loc.add(vel);

  //wrap the ball's position
  if (loc.x + diam/2 >= width) {
    loc.x = diam/2;     
  } else if (loc.x - diam/2 <= 0) {
    loc.x = width - diam/2;
  }
  if (loc.y + diam/2 >= height) {
    loc.y = diam/2;
  } else if (loc.y - diam/2 <= 0) {
    loc.y = height - diam/2;
  }
  
  //draw a white line showing the direction and magnitude of acceleration in the center of the screen
  stroke(255);
  line(width/2, height/2, width/2 + 200*acc.x, height/2 + 200*acc.y);
  //draw a black line showing the direction and magnitude of velocity in the center of the screen
  stroke(0);
  line(width/2, height/2, width/2 + 20*vel.x, height/2 + 20*vel.y);
}