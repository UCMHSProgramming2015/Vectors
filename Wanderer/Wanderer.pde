//declare variables

int count = 10;
float[] diam = new float[count]; 
PVector[] loc = new PVector[count];
PVector[] vel = new PVector[count];
PVector[] acc = new PVector[count];

void setup() {
  //set size of canvas
  size(800, 600);
  
  for(int i = 0; i < count; i++){
  //initialize variables
  loc[i] = new PVector(width/2, height/2); 
  vel[i] = new PVector(0, 0);
  acc[i] = PVector.random2D();
  acc[i].mult(.1);
  
  diam[i] = 80;
  
  }
  noStroke();
}

void draw() {
  
  //draw background to cover previous frame
  background(0);
  
  for(int i = 0; i < count; i++){
    
  acc[i] = PVector.random2D();
  acc[i].mult(.1);
  vel[i].limit(1);
  


  
  //draw ball
  ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

  //add acceleration to velocity
  vel[i].add(acc[i]);

  //add velocity to position
  loc[i].x += vel[i].x;
  loc[i].y += vel[i].y;

  //wrap the ball's position
  if (loc[i].x >= width) {
    loc[i].x = 0;     
  } else if (loc[i].x <= 0) {
    loc[i].x = width ;
  }
  if (loc[i].y >= height) {
    loc[i].y = 0;
  } else if (loc[i].y <= 0) {
    loc[i].y = height;
  }
  
  }
  
}