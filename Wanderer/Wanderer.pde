//declare variables
int count =20;
int timerDelay = 30;
int counter;
int mode;
int tim = 0;
int circ = 20;
float[] diam = new float [count];
float[] a = new float [count];
float[] d = new float [count];
PVector[] loc = new PVector [count];
PVector[] vel = new PVector [count];
PVector[] acc = new PVector [count];
float[] colorsr = new float[count]; 
float[] colorsg = new float[count];
float[] colorsb = new float[count];
int cmode=0;
void setup() {
  //set size of canvas
  size(800, 800);
  mode = 0;
  for ( int i = 0; i < count; i++) {
    //initialize variables

    loc[i] = new PVector(random(width), random(0));
    diam[i] = random(20, 80);
    vel[i] = PVector.random2D();
    acc[i] = new PVector();
    acc[i].mult(1);

    //Adds color
    colorsr[i]= random(0, 255);
    colorsg[i]= random(0, 255);
    colorsb[i]= random(0, 255);
  }
}

void draw() {
  counter = frameCount%5;
  println("Frame count: " + frameCount + "    Counter: " + counter);
  if (mode==0) {
    background(255);

    stroke(0);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("Press ENTER to begin", width/2, height/2);
  }
  if (mode==1) {
    //draw background to cover previous frame
    background(255);

    for ( int i = 0; i < count; i++) {
      acc[i] = PVector.random2D();

      //Adds color
      fill(colorsr[i], colorsg[i], colorsb[i]);
      //draw balls
      ellipse(loc[i].x, loc[i].y, diam[i], diam[i] );

      //Adds ball where cursor is
      noCursor();
      fill(0);
      ellipse(mouseX, mouseY, circ, circ);

      //Add acceleration to velocity
      vel[i].add(acc[i]);
      vel[i].limit(5);

      //add velocity to position
      loc[i].add(vel[i]);

      //wrap the ball's position
      if (loc[i].x  >= width) {
        loc[i].x  = 0;
      } else if (loc[i].x  <= 0) {
        loc[i].x  = width;
      }
      if (loc[i].y  >= height) {
        loc[i].y  = 0;
      } else if (loc[i].y  <= 0) {
        loc[i].y  = height ;
      }


      //If little  ball touches others program ends
      if (dist(mouseX, mouseY, loc[i].x, loc[i].y) < diam[i]) {
        mode=2;
        println("Stop touching me");
      }
    }
    //Shows timer
    fill(0);
    if (frameCount%timerDelay == 0) {
      tim+= 1;
    }
    text(tim, width/2, height/6);
  }

  if (mode==2) {
    background(255);
    text("Press backspace to replay", width/2, height/6);
    text("You lose, shucks", width/2, height/2);
    text(tim, width/2, height-height/6);

    //Resets game
    for (int i=0; i<count; i++) {
      loc[i] = new PVector(random(width), random(0));
    }
  }
}
void keyPressed() {
  if (keyCode==ESC) {    //If ESC is pressed, exit program
    exit();
  }
  if (keyCode==ENTER) {
    mode=1;
  }
  if (keyCode==BACKSPACE) {
    mode=0;
  }
}
void mouseClicked() {
  //if Cursor clicked colors change
  for (int i=0; i<count; i++) {
    colorsr[i]= random(0, 255);
    colorsg[i]= random(0, 255);
    colorsb[i]= random(0, 255);
  }
}