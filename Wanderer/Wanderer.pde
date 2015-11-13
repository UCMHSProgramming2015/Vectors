//declare variables
float diam;
PVector pos, vel, acc;
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  pos = new PVector(width/2,height/2);
  diam = 80;
  vel = PVector.random2D();
  vel.mult(8);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(pos.x, pos.y, diam, diam);

  //add velocity to position
  pos.add(vel);
  //random acceleration, decreases and reverses velocity if it's too high
  acc = PVector.random2D();
  vel.add(acc);
  if (vel.mag() > 20) {
    vel.mult(-0.5);
  }
  //wrap the ball's position
  if(pos.x<0) {
    pos.x+=width;
  }
  if(pos.x>width) {
    pos.x+=-width;
  }
  if(pos.y<0) {
    pos.y+=height;
  }
  if(pos.y>height) {
    pos.y+=-height;
  }
}