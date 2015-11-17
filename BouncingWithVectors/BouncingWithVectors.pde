//declare variables
int num = 15;
float [] diam = new float[num];
PVector [] loc = new PVector[num];
PVector [] vel = new PVector[num];

void setup() {
  //set size of canvas
  size(800, 600, P3D);

  //initialize variables
  for(int i = 0; i < num; i++) {
    diam[i] = 80;
    loc[i] = new PVector(width/2, height/2, 0);
    vel[i] = PVector.random3D();
    vel[i].mult(5);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //draw box
  pushMatrix();
  translate(width/2,height/2);
  noFill();
  stroke(255);
  box(width);
  popMatrix();
  
  for(int i = 0; i < num; i++) {
    //draw ball
    pushMatrix();
    stroke(255,0,0);
    translate(loc[i].x,loc[i].y,loc[i].z);
    sphere(diam[i]);
    popMatrix();

    //add velocity to position
    loc[i].add(vel[i]);

    //bounce ball if it hits walls
    if (loc[i].x + diam[i]/2 >= width || loc[i].x - diam[i]/2 <= 0) {
      vel[i].x *= -1;    //if the ball hits the side, assign the x velocity the opposite version
    }
    if (loc[i].y + diam[i]/2 >= height || loc[i].y - diam[i]/2 <= 0) {
      vel[i].y *= -1;
    }
    if (loc[i].z - diam[i]/2 <= -sqrt(sq(width)+sq(height))/2) {
      vel[i].z *= -1;
    } else {
      vel[i].z -= 1;
    }
  }
}