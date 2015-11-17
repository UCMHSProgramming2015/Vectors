//declare variables
float[] diam = new float[count];
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[]acc = new PVector[count];
int count=30;

void setup() {
  //set size of canvas
  size(800, 600);
int i=0;
while(i<count){
  //initialize PVectors
  loc[i] = new PVector(width/2, height/2);
  vel[i] = new PVector (0,0);
 acc[i] = PVector.random2D();
 acc[i].mult(0.1);
 diam[i] = 80;
}
}

void draw() {
int i=0;
  acc[i] = PVector.random2D();
  
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc.x, loc.y, diam, diam);
  ellipse(mouseX, mouseY, 30, 30);
//multiply acc by 0.1
acc[i].mult(0.1);


//add acc to vel
vel[i].add(acc[i]);

//magnitude of vel cannot be greater than 1
vel[i].limit(1);

  //add velocity to position
  loc[i].add(vel[i]);

  //wrap the ball's position
  if (loc.x[i] >= width) {
    loc.x[i] = -loc.x;
  } else if (loc.x <= 0) {
    loc.x = -loc.x;
  }
  if (loc.y+diam/2 >= height) {
    loc.y = -loc.y;
  } else if (loc.y+diam/2 <= 0) {
    loc.y = -loc.y;
  }
  
 
}