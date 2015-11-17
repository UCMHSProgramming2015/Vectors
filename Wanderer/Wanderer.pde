//declare variables
PVector loc;
PVector vel = PVector.random2D();
PVector acc;
int diam = 80;
PVector [] ripples = new PVector[100];

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize location
  loc = new PVector(width/2, height/2);
  
  //assign initial ripples
  for (int i = 0; i < 100; i++) {
    ripples[i] = new PVector(0, 0);
  }
}

void draw() {
  //draw background to cover previous frame
  background(128,196,255);

  PVector acc = PVector.random2D();
  acc.mult(0.1);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.add(vel);

  //add acceleration to velocity
  vel.add(acc);
  vel.limit(100);

  //reassign ripple values
  for (int i = 99; i > 0; i--) {
    ripples[i] = ripples[i-1];
  }

  //draw ripples
  for (int i = 0; i < 50; i++) {
    ripples[0] = loc;
    noFill();
    strokeWeight(2);
    stroke(0,255-25*i);
    ellipse(ripples[i].x, ripples[i].y, diam+100*i, diam+100*i);
  }

  //wrap the ball's position
  if (loc.x > width) {
    loc.x = 0;
  } else if (loc.x < 0) {
    loc.x = width;
  }
  if (loc.y > height) {
    loc.y = 0;
  } else if (loc.y < 0) {
    loc.y = height;
  }
}