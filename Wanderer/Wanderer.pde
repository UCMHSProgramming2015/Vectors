//declare variables
int count = 5;
int colors = 0;
PVector []acc = new PVector [count];
PVector[] loc = new PVector [count];
float []diam = new float [count];
PVector[] vel = new PVector [count];

//float []x = new float [count];
void setup() {
  //set size of canvas

  size(800, 600);
  for (int i=0; i < count; i++) {
    //initialize variables
    loc[i] = new PVector(width/2, height/2); 
    diam[i] = 50;
    vel[i] =PVector.random2D();
    vel[i].mult(1); 
    acc[i] = PVector.random2D();
    acc[i].mult(.001); 
    background(0);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for (int i=0; i < count; i++) {
    //draw ball

    vel[i].add(acc[i]); 
    noStroke();
  //.  fill(random(255), random(255), random(255));
    //vel[i] = PVector.random2D().mult(random(8));
    ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

    //add velocity to position
    loc[i].add(vel[i]); 
    vel[i].limit(5);

    //wrap the ball's position

    if (loc[i].x >= width) {
      loc[i].x = 0;    //if the ball hits the right wall go to left wall
    } else if (loc[i].x <= 0) {
      loc[i].x = width;     //if the ball hits the left wall go to right wall
    }
    if (loc[i].y >= height) {
      loc[i].y = 0;
    } else if (loc[i].y <= 0) {
      loc[i].y = height ;
    }
  }
}