//declare variables
//float diam [i];

//PVector loc; //replaces loc.x,loc.y [i]

//PVector vel;  // replaces vel.loc.x/loc.y [i]
int count = 25;
float [] diam = new float[count];
float [] y= new float[count];
float [] loc= new float[count];
float [] vel= new float[count];

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  // loc.x = width/2;
  // loc.y [i] = height/2;
 

for (int i = 0; i < count; i++) {
  loc [i] = new PVector(width/2, height/2);
   vel [i] = PVector.random2D();
  diam [i] = random(30,100);
  y [i] = height/2;
  // vel.loc.x = random(-5, 5);
  //vel.loc.y [i] = random(-5, 5);
  
}
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc[i].x, loc.y[i], diam [i], diam [i]);

  //add velocitloc.y [i] to position
  //loc.x += vel.x;
  //loc.y [i] += vel.y [i];
  loc[i].add(vel[i]);

  //bounce ball if it hits walls
  if (loc[i].x + diam [i]/2 >= width) {
    vel[i].x = -abs(vel[i].x);    //if the ball hits the right wall, assign loc.x velocitloc.y [i] the negative version of itself
  } else if (loc[i].x - diam [i]/2 <= 0) {
    vel[i].x = abs(vel[i].x);     //if the ball hits the left wall, assign loc.x velocitloc.y [i] the positive version of itself
  }

  if (loc[i].y[i] + diam [i]/2 >= height) {
    vel[i].y [i] = -abs(vel[i].y [i]);
  } else if (loc[i].y [i] - diam [i]/2 <= 0) {
    vel[i].y [i] = abs(vel[i].y [i]);
  }
}