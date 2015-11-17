//declare variables
float diam, diamChange;
PVector loc, vel, accel;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  diam = 80;
  loc =  new PVector(width/2,height/2); //makes a new PVector class
  vel = new PVector(1,0.5);
  accel = PVector.random2D(); // calling random2D() method on class PVector returns a PVector
  accel.mult(3);
}

void draw() {
  accel = PVector.random2D();
  accel.mult(2);
  //draw background to cover previous frame
  background(0);

  //draw ball
  fill(255);
  ellipse(loc.x, loc.y, diam, diam);
  
  //add some text telling it's an electron
  textAlign(CENTER);
  textSize(32);
  fill(0);
  text("e-", loc.x, loc.y);
  
  //add velocity to position
  loc.add(vel);
  
  //add acceleration to velocity
  vel.add(accel);
  vel.limit(10); //so it doesn't go too fast
  //println(sqrt(pow(vel.x,2)+pow(vel.y,2))); maximum vel is 10
  
  //change the size of the radius
  //check to make sure diam is not less than 0 and not more than 100
  if(diam <= 0) {
    diamChange = random(0,10);
  } else if(diam > 100) {
    diamChange = random(-10,0);
  } else{ 
    diamChange = random(-10,10);
  }
    
  diamChange = random(-5,5);
  diam += diamChange;


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