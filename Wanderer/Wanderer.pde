//declare variables
float diam, d;
PVector loc, vel, accel, loc2, vel2, accel2;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc = new PVector(width/4,height/4);//intialzing loc. is the same as intializing x and y
  diam = 70;
  vel = PVector.random2D();
    vel.mult(5);
  accel = new PVector();
   loc2 = new PVector(width*3/4,height*3/4);//intialzing loc. is the same as intializing x and y
  vel2 = PVector.random2D();
    vel2.mult(5);
  accel2 = new PVector();
    d= loc.dist(loc2);
}

void draw() {
  //declare acceleration
  accel = PVector.random2D();
  accel2 = PVector.random2D();
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x,loc.y, diam, diam);

  //add velocity to position
 loc.add(vel);
 vel.add(accel);
 vel.limit(5);
 //draw second ball
   ellipse(loc2.x,loc2.y, diam, diam);
   //add velocity to second ball
    loc2.add(vel2);
 vel2.add(accel2);
 vel2.limit(5);
   


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
  //wrap the second ball's position
  if (loc2.x >= width) {
    loc2.x = 0;     
  } else if (loc2.x <= 0) {
    loc2.x = width;
  }
  if (loc2.y >= height) {
    loc2.y = 0;
  } else if (loc2.y <= 0) {
    loc2.y = height; 
  }
  if (d <= 45){
    loc.x = -loc.x;//the two circles will never touch
 
  }
}