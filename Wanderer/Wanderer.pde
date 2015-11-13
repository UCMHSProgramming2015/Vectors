//declare variables
float x, y, velX, velY, diam;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  x = width/2;
  y = height/2;
  diam = 80;
  velX = random(-10,10);
  velY = random(-10,10);
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(x, y, diam, diam);

  //add velocity to position
  x += velX;
  y += velY;

  //wrap the ball's position
  if(x<0) {
    x+=width;
  }
  if(x>width) {
    x+=-width;
  }
  if(y<0) {
    y+=height;
  }
  if(y>height) {
    y+=-height;
  }
}