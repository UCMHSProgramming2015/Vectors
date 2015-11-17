//declare variables
int diam = 50;
int count = 50;
PVector []loc = new PVector [count];
PVector []vel = new PVector [count];
PVector []acc = new PVector [count];

void setup() {
  //set size of canvas
  size(800, 600);

  for (int i = 0; i < count; i++) {
    loc[i] = new PVector (width/2, height/2);
    vel[i] = new PVector (0, 0);
    acc[i] = PVector.random2D();
    acc[i].mult(.5);
  }
}

void draw() {

  for (int i = 0; i < count; i++) {
    //draw ball
    fill(0,0,0, 30);
    stroke(255);
    ellipse(loc[i].x, loc[i].y, diam, diam);

    //add velocity, accel
    acc[i] = PVector.random2D();
    acc[i].mult(.5);
    vel[i].limit(3);

    //draw background to cover previous frame

    //add velocity to position
    loc[i].add(vel[i]);
    vel[i].add(acc[i]);

    //wrap the ball's position
    if (loc[i].x >= width) {
      loc[i].x = 0;    //if the ball hits the right wall, assign x velocity the negative version of itself
    } else if (loc[i].x <= 0) {
      loc[i].x = width;     //if the ball hits the left wall, assign x velocity the positive version of itself
    }
    if (loc[i].y >= height) {
      loc[i].y = 0;
    } else if (loc[i].y <= 0) {
      loc[i].y = height;
    }
  }
}