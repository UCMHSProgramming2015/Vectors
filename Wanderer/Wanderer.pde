//declare variables
PVector loc,vel,acc;
float diam;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc=new PVector(random(diam,width-diam),random(diam,height-diam));
  vel=PVector.random2D();
  acc=new PVector();
  diam = 80;

}

void draw() {
  //draw background to cover previous frame
  background(0);
  
  acc=PVector.random2D();
  acc.mult(.2);
 

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  fill(255,204);
  

  //add velocity to position
  //loc.x += vel.x;
  //loc.y += vel.y;
  loc.add(vel);
  
  //add acceleration to velocity
  vel.add(acc);
  vel.limit(5);

  //wrap the ball's position
  if (loc.x >= width) {
    loc.x = 0;     
  } else if (loc.x  <= 0) {
    loc.x = width;
  }
  if (loc.y >= height) {
    loc.y = 0;
  } else if (loc.y <= 0) {
    loc.y = height;
  }
}