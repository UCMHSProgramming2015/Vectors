//declare variables and vectors
PVector loc;
PVector vel;
float diam;
PVector acc;
PVector loc2;
PVector vel2;
PVector acc2;

void setup() {
  //set size of canvas
  size(800, 600);
        //loc.x = width/2;
        //loc.y = height/2;
        //velX = random(-5, 5);
        //velY = random(-5, 5);
        
   //assign each variable a value
  loc = new PVector(width/2, height/2); //location of first ball
  vel = PVector.random2D(); //assign velocity of first ball to be random 2D vector
  acc = new PVector(); //assign acceleration of first ball to be vector
  diam = 80; //diam of ball
  vel.x = random(-5, 5); //random x and y velocities of the first ball
  vel.y = random(-5, 5);
  loc2 = new PVector(width/2, height/2); //location of second ball
  vel2 = PVector.random2D(); //assign velocity of second ball to be random 2D vector
  acc2 = new PVector(); //assign acceleration of second ball to be vector 
  vel2.x = random(-5, 5); //x and y velocties of the second ball
  vel2.y = random(-5, 5);
}

void draw() {
  if (!keyPressed) {
    //draw background to cover previous frame
    background(0);
    //draw ball
    acc = PVector.random2D(); //assign both accelerations to random 2D vector
    acc2 = PVector.random2D();
    ellipse(loc.x, loc.y, diam, diam); //draw both ellipses using the declared variables
    ellipse(loc2.x, loc2.y, diam, diam);
    //add velocity to position
    acc.mult(.5); //multiply first ball acceleration
    vel.add(acc); //add velocity and acceleration vector of first ball
    vel.limit(5); //limit the velocity of the first ball
    loc.add(vel); //add location and velocity of first ball
    acc2.mult(.5); //multiply second ball acceleration
    vel2.add(acc2); //add velocity and acceleration vector of second ball
    vel2.limit(5); //limit the velocity of the second ball
    loc2.add(vel2); //add location and velocity of second ball
    //wrap the both ball's position
    if (loc.x >= width) {
      loc.x = 0;
    } else if (loc.x<= 0) {
      loc.x = width;
    }
    if (loc.y >= height) {
      loc.y = 0;
    } else if (loc.y<= 0) {
      loc.y = height;
    }
    
        if (loc2.x >= width) {
      loc2.x = 0;
    } else if (loc2.x<= 0) {
      loc2.x = width;
    }
    if (loc2.y >= height) {
      loc2.y = 0;
    } else if (loc2.y<= 0) {
      loc2.y = height;
    }
  }
}
void mousePressed() {
  if (mousePressed) {
    fill(random(255), random(255), random(255)); //if mouse is pressed change fill of balls to random color
  }
}