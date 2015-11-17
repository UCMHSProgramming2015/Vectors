//declare variables
float diam;

PVector loc; //declared loc
PVector vel; //declared vel
PVector acc; //declared acc; acceleration

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2, height/2);
  vel = PVector.random2D();
  vel.mult(0);
  diam = 80;
}

void draw() {
  //draw background to cover previous frame
  acc = PVector.random2D(); //initialize acceleration
  acc.mult(.5); //gradually increase velocity with acceleration
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  
  //add acceleration to velocity
  vel.add(acc);

  //add velocity to position
  loc.add(vel);
  
  //Limit velocity
  vel.limit(5);


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
  if(loc.x >= width/2);{
    fill(0,0,255); //blue on right side
  } 
  if(loc.x <= width/2){
    fill(255,0,0); //red on left side
  }
  if(loc.y <= height/2){
    text("Up is Yup", width/2, 450);
  }
  if(loc.y >= height/2){
    text("Down is Bound", width/2, 150);
  }
  
}