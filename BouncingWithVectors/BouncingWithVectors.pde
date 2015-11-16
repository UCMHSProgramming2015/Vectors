//declare variables
int count = 20;
float diam ;
//float loc.x,loc.y
PVector[] loc = new float[count]; //replaces loc.x & loc.y

//float vel.loc.x, vel.loc.y
PVector[] vel = new float[count]; //replaces vel.loc.x & vel.loc.y

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  //loc.x = width/2
  //loc.y = height/2
  for (int i = 0; i<count; i++) {
    loc[i]= new PVector(width/2, height/2);
    diam = 80;
    //vel.loc.x= random(-5,5)
    //vel.loc.y= random(-5,5)
    vel[i] = PVector.random2D();
    vel.mult(5);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for (int i =20; i<count; i++) {

    //draw ball
    ellipse(loc[i].x, loc[i].y, diam, diam);

    //add velocity to position
    //loc.x += vel.x;
    //loc.y += vel.y;
    loc[i].add(vel[i]);

    //bounce ball if it hits walls
    if (loc[i].x + diam/2 >= width) {
      vel[i].x = -abs(vel[i].x);    //if the ball hits the right wall, assign loc.x velocityloc.y the negative version of itself
    } else if (loc[i].x - diam/2 <= 0) {
      vel[i].x = abs(vel[i].x);     //if the ball hits the left wall, assign loc.x velocityloc.y the positive version of itself
    }
    if (loc[i].y + diam/2 >= height) {
      vel[i].y = -abs(vel[i].y);
    } else if (loc[i].y - diam/2 <= 0) {
      vel[i].y = abs(vel[i].y);
    }
  }
}
}