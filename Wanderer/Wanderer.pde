//declare variables
PVector loc,vel,acc;
float diam;


void setup() {
  size(800, 600); //set canvas size

  //initialize variables
  diam = 80;
  loc = new PVector(random(diam,width-diam),random(diam,height-diam));
  vel = PVector.random2D();
  acc = new PVector();
  //acc = PVector.random;
  //acc.mult(.1);
}

void draw() {
  background(0); //draw background to cover previous frame
  

  ellipse(loc.x, loc.y, diam, diam); //draw ball

  //loc.x += vel.x; (possibility)
   //loc.y += vel.y;
   loc.add(vel); //add vel to location to change location (move bal)
   vel.add(acc); //acceleration is added to vel to increase it
  vel.limit(5); //vel's max magnitude is 5
    //acc.mult(.1); (possibility to go with comments in setup
  acc = PVector.random2D();
  acc.mult(.2);

  //wrap the ball's position
  if (loc.x >= width) {
    fill(random(255),0,0);
    loc.x = 0;
    
  } else if (loc.x <= 0) {
    loc.x = width;

  }
  if (loc.y >= height) {
    fill(0,random(255),0);
    loc.y = 0;
  
  } else if (loc.y <= 0) {
    loc.y = height;
  
  }
}