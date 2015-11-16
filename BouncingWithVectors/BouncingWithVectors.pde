int count = 80; //makes 60  balls

//declare variables

float [] diam = new float [count]; //diameter


//float loc.x, loc.y  
PVector [] loc = new PVector [count];
PVector [] vel = new PVector [count];  // replaces x,y, vel[i]x, vel[i]y, 


void setup() {
  //set size of canvas
  size(800, 600);
  for (int i = 0; i < count; i ++) { //for arrays
    //initialize variables
    loc [i] = new PVector (random(350,450), height/2); //starts ellipse off in a random position from 350-450, middle of screen 
    vel[i] = PVector.random2D(); //gives speed magnitude of one
    vel[i].mult(random(5,8)); //increased speed
    diam [i] = random(3,88); //diameter
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for (int i = 0; i < count; i ++) { //for arrays
    strokeWeight(3); // increased stroke weight 
    stroke(random(206), random(235), random(245)); //gives random stroke
    //draw ball
    ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

    //add vel[i]ocitloc.y to position
    loc[i].add(vel[i]);

    //bounce ball if it hits walls
    if (loc[i].x + diam[i]/2 >= width) {
      vel[i].x = -abs(vel[i].x);    //if the ball hits the right wall, assign loc.x vel[i]ocitloc.y the negative version of itself
    } else if (loc[i].x - diam[i]/2 <= 0) {
      vel[i].x = abs(vel[i].x);     //if the ball hits the left wall, assign loc.x vel[i]ocitloc.y the positive version of itself
    }
    if (loc[i].y + diam[i]/2 >= height) {
      vel[i].y = -abs(vel[i].y);
    } else if (loc[i].y - diam[i]/2 <= 0) {
      vel[i].y = abs(vel[i].y);
    }
  }
}