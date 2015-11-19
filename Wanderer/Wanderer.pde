//declare variables
float diam;
PVector[] loc = new PVector [40];
PVector[] vel = new PVector [40];
PVector[] acc = new PVector [40];

void setup() {
  //set size of canvas
  size(600, 600);
  for (int i=0; i<40; i++) {
    //initialize variables
    loc[i] = new PVector(width/2, height/2);
    diam = 50;
    vel[i] = new PVector(0, 0);
    acc[i]= PVector.random2D();
    acc[i].mult(.5);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  for (int i=0; i<40; i++) {
    //add aesthetic
    strokeWeight(15);
    noFill();
    if (i<8) {
      stroke(255, 230, 234, 100);
    } else if (i<16) {
      stroke(240, 240, 240, 100);
    } else if (i<24) {
      stroke(223, 247, 246, 100);
    } else if (i<32) {
      stroke(161, 227, 224, 100);
    } else if (i<40) {
      stroke(120, 191, 188, 100);
    }

    //draw ball
    ellipse(loc[i].x, loc[i].y, diam, diam);

    //add vel[i]oc[i]ity to position

    acc[i]= PVector.random2D();
    acc[i].mult(.5);

    vel[i].add(acc[i]);
    loc[i].add(vel[i]);
    if(vel[i].mag()>5){
    vel[i].setMag(5);
  }

    //wrap the ball's position
    if (loc[i].x + diam/2 >= width) {
      vel[i].x = -abs(vel[i].x);
    } else if (loc[i].x - diam/2 <= 0) {
      vel[i].x = abs(vel[i].x);
    }
    if (loc[i].y + diam/2 >= height) {
      vel[i].y = -abs(vel[i].y);
    } else if (loc[i].y - diam/2 <= 0) {
      vel[i].y = abs(vel[i].y);
    }
  }
}