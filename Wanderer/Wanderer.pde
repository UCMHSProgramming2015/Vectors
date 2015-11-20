//declare variables
int quantity = 30;
float diam, R, shade;
//coords = coordinates; velka = velocity
PVector[] coords = new PVector[quantity];
PVector[] velka = new PVector[quantity];
PVector[] accel = new PVector[quantity];

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  noStroke();
  smooth();
  for (int i = 0; i < quantity; i++) {
    //initialize variables
    diam = 40;
    R = 0;
    shade = 0.1;
    coords[i] = new PVector(width/2, height/2);
    velka[i] = PVector.random2D();
    velka[i].mult(1);
    accel[i] = PVector.random2D();
    accel[i].mult(.05);
  }
}

void draw() {
  //draw background to cover previous frame
  background(0);

  //colour
  for (int i = 0; i < quantity; i++) {
    accel[i] = PVector.random2D();

    //colour
    fill(R, 0, 0);
    R = R += shade;
    if (R <= 0 || R >= 100) {
      shade = -shade;
    }

    //draw ball
    ellipse(coords[i].x, coords[i].y, diam, diam);

    //add velocity to position
    coords[i].add(velka[i]);
    velka[i].add(accel[i]);
    velka[i].limit(7);

    //wrap the ball's position
    if (coords[i].x - diam/2 >= width && velka[i].x > 0) {
      coords[i].x = -diam/2;
    } else if (coords[i].x + diam/2 <= 0 && velka[i].x < 0) {
      coords[i].x = width + diam/2;
    }
    if (coords[i].y - diam/2 >= height && velka[i].y > 0) {
      coords[i].y = -diam/2;
    } else if (coords[i].y + diam/2 <= 0 && velka[i].y < 0) {
      coords[i].y = height + diam/2;
    }
  }
}