//declare variables
float diam, c;
PVector loc, vel;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/2,height/2);
  vel = PVector.random2D();
  diam = 80;
  c=0;
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  fill(random(255), random(255), random(255));
  ellipse(loc.x, loc.y, diam, diam);
  //add velocity to position
 loc.add(vel);
if(true){
  c+=1;
}
if(c>=30){
  c = 0;
  vel.x=random(-4,4);
  vel.y=random(-4,4);
}
  //wrap the ball's position
  if (loc.x>= width) {
    loc.x = 0;     
  } else if (loc.x<= 0) {
    loc.x = width;
     vel.mult(1.1);
  }
  if (loc.y>= height) {
    loc.y = 0;
  } else if (loc.y<= 0) {
    loc.y = height;
  }
}