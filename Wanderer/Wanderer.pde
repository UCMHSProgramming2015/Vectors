//declare variables

int count=30;
float[] diam = new float[count];
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[]acc = new PVector[count];


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
 i++;
}
}

void draw() {
int i=0; 
while(i<count){
   
  acc[i] = PVector.random2D();
  
  //draw background to cover previous frame
  background(0);

  //draw ball
  ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);
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
  if (loc[i].x >= width) {
    loc[i].x = -loc[i].x;
  } else if (loc[i].x <= 0) {
    loc[i].x = -loc[i].x;
  }
  if (loc[i].y+diam[i]/2 >= height) {
    loc[i].y = -loc[i].y;
  } else if (loc[i].y+diam[i]/2 <= 0) {
    loc[i].y = -loc[i].y;
  }

 i++; 
}
}