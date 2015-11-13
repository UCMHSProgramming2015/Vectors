//declare variables
float diam, c;
PVector loc;
PVector vel;
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc= new PVector(width/2, height/2);
  diam = 80;
  vel = new PVector (random(-5, 5),random(-5, 5));
  c=0;
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
if(true){
  c=c+1;}
  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;
if (c>=30){ 
  c=0;
  vel.x=random(-32,32);
  vel.y=random(-32,32);
}
  //wrap the ball's position
  if (loc.x  >= width) {
    loc.x = 0;
  } else if (loc.x <= 0) {
    loc.x = width;
  }
  if (loc.y >= height) {
    loc.y = 0;
  } else if (loc.y <= 0) {
    loc.y = height;
  }
}