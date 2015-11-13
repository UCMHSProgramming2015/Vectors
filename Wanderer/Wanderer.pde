//declare variables
PVector loc;
PVector v;
float diam, c;

void setup() {
  //set size of canvas
  size(800, 600);
  loc = new PVector(width/2, height/2);
  diam = 80;
  v = new PVector (random(-3,4), random(-3,4));
  c = 0;
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.add(v);
if(true){
  c += 1;
}
if(c >=25){
  c = 0;
  v.x = random(-3, 4);
  v.y = random(-3, 4);
}
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
}