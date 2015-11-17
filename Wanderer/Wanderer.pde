//declare variables
PVector loc;
PVector vel;
PVector acc;
float diam;

void setup() {
  //set size of canvas
  loc= new PVector(width/2,height/2);
  vel= PVector.random2D();
  acc= new PVector();
<<<<<<< HEAD
  size(800, 600);
=======
  size(900, 600);
>>>>>>> refs/remotes/origin/Wanderer

  //initialize variables
  diam = 80;
  vel.x = random(-5, 5);
  vel.y = random(-5, 5);
}

void draw() {
  //draw background to cover previous frame
  //add acceleration to velocity and multiply it by a decimal to make it smaller
  background(0);
  acc=PVector.random2D();
  acc.mult(.4);
  vel.add(acc);
<<<<<<< HEAD
  //draw ball
=======
  //draw ball and add color
>>>>>>> refs/remotes/origin/Wanderer
  fill(0,255,255);
  ellipse(loc.x, loc.y, diam, diam);

  //add velocity to position
  loc.x += vel.x;
  loc.y += vel.y;

<<<<<<< HEAD
  //wrap the ball's position
=======
  //make ball ounce when it touches a side
>>>>>>> refs/remotes/origin/Wanderer
  if (loc.x + diam/2 >= width) {
    vel.x = -vel.x;     
  } else if (loc.x - diam/2 <= 0) {
    vel.x = -vel.x ;
  }
  if (loc.y + diam/2 >= height) {
    vel.y = -vel.y;
  } else if (loc.y - diam/2 <= 0) {
    vel.y = -vel.y;
  }
}