//declare variables
PVector loc;
PVector vel;
float diam;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  //loc.x = width/2;
  //loc.y = height/2;
  diam = 80;
  //velX = random(-5, 5);
  //velY = random(-5, 5);
  loc = new PVector(width/2,height/2);
  vel = PVector.random2D();
}

void draw() {
if (!keyPressed) {
    //draw background to cover previous frame
    background(0);
    //draw ball
    ellipse(loc.x, loc.y, diam, diam);

    //add velocity to position
    loc.x += vel.x;
    loc.y += vel.y;

    //wrap the ball's position
    if (loc.x >= width) {
      loc.x = 0;
    } else if (loc.x<= 0) {
      loc.x = width;
    }
    if (loc.y >= height) {
      loc.y = 0;
    } else if (loc.y<= 0) {
      loc.y = height;
    }
  }
}
void mousePressed() {
  if (mousePressed) {
    fill(random(255), random(255), random(255));
  }
}