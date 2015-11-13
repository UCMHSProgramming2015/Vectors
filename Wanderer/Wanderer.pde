//declare variables
float x, y, velX, velY, diam;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  x = width/2;
  y = height/2;
  diam = 80;
  velX = random(-5, 5);
  velY = random(-5, 5);
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
  if (x + diam/2 >= width) {
    x = diam/2;     
  } else if (x - diam/2 <= 0) {
    x = width - diam/2;
  }
  if (y + diam/2 >= height) {
    y = diam/2;
  } else if (y - diam/2 <= 0) {
    y = height - diam/2;
  }
}