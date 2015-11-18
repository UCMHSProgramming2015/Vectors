int count = 8; 

//declare variables
PVector [] loc = new PVector [count]; 
;
PVector [] vel = new PVector [count]; 
float [] diam = new float [count];

void setup() {
  //set size of canvas
  size(800, 600);
  for (int i = 0; i < count; i++) {
    //initialize variables
    loc [i] = new PVector (width/2, height/2); 
    diam [i] = 80;
    vel [i] = PVector.random2D();
    vel[i].mult(5);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);
  for (int i = 0; i < count; i ++) {
    //draw ball
    ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);

    //add velocity to position
    loc[i].add(vel[i]); 

    //wrap the ball's position
    if (loc[i].x >= width) {
      loc[i].x = 0;
    } else if (loc[i].x <= 0) {
      loc[i].x = width ;
    }
    if (loc[i].y >= height) {
      loc[i].y = 0;
    } else if (loc[i].y  <= 0) {
      loc[i].y = height ;
    }
  }
}