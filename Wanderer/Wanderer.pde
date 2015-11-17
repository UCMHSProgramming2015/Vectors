//declare variables
float diam;
PVector loc, vel, acc;
PImage bg;
PImage wanderer;
void setup() {
  //set size of canvas
  size(800, 600);
  //initialize variables
  loc = new PVector(width/2, height/2);
  diam = 80;
  vel = new PVector(0,0);
  colorMode(HSB, 800, 600, 100);
  bg = loadImage("bg.jpg");
  wanderer = loadImage("wanderer.png");
}

void draw() {
  //draw background to cover previous frame
  background(bg);
  //add color to ball
  fill(loc.x, loc.y, 100);
  acc = PVector.random2D();  
  acc.mult(0.1);
  //draw ball
  
  translate(loc.x, loc.y);
  scale(.5, .5);
  translate(-wanderer.width/2, -wanderer.height/2);
  image(wanderer, 0, 0);
  resetMatrix();
  
  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;
  vel.x += acc.x;
  vel.y += acc.y;
  
  //wrap the ball's position
  if (loc.x  >= width) {
    vel.x = -abs(vel.x);     
  } else if (loc.x <= 0) {
    vel.x = abs(vel.x);
  }
  if (loc.y >= height) {
    vel.y = -abs(vel.y);
  } else if (loc.y <= 0) {
    vel.y = abs(vel.y);
  }
  
  
}