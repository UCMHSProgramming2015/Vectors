//declare variables
float diam;
PVector pos, vel, acc;
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  pos = new PVector(width/2,height/2);
  diam = 80;
  vel = new PVector(0,0);
  colorMode(HSB);
  strokeWeight(10);
}

void draw() {
  //draw background to cover previous frame
  background(150,80,100);

  //draw ball
  stroke(map(pos.y,0,height,0,256),100,100);
  ellipse(pos.x, pos.y, diam, diam);

  //add velocity to position
  pos.add(vel);
  //random acceleration, decreases and reverses velocity if it's too high
  acc = PVector.random2D();
  acc.mult(.5);
  vel.add(acc);
  if (vel.mag() > 15) {
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