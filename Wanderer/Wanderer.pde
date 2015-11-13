//declare variables
float diam,d,a;
PVector loc, vel, acc;
void setup() {
  //set size of canvas
  size(800, 800);

  //initialize variables
  loc = new PVector(width/2,height/2);
  diam = 80;
  vel = PVector.random2D();
  acc = new PVector();
  acc.mult(1);
}

void draw() {
  //draw background to cover previous frame
  background(frameCount%400);
  acc = PVector.random2D();
  


  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //Add acceleration to velocity
  vel.add(acc);
  vel.limit(5);

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
    loc.y = height ;
  }
}
void keyPressed(){
  if(keyCode==ESC){
    exit();
  }
}