//declare variables
PVector loc,vel,acc;
PVector loc2,vel2,acc2;
float diam;

void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  loc=new PVector(random(diam,width-diam),random(diam,height-diam));
  vel=PVector.random2D();
  acc=PVector.random2D();
  acc.mult(.4);
  
  loc2=new PVector(random(diam,width-diam),random(diam,height-diam));
  vel2=PVector.random2D();
  acc2=PVector.random2D();
  acc2.mult(.2);
   
  diam=80;
}

void draw() {
  //draw background to cover previous frame
  background(0);
  
  //acceleration for ball 1
  acc=PVector.random2D();
  acc.mult(.4);
 
  //acceleration for ball 2
  acc2=PVector.random2D();
  acc2.mult(.2);

  //draw balls 1 and 2
  ellipse(loc.x, loc.y, diam, diam);
  ellipse(loc2.x,loc2.y,diam,diam);
  fill(255,204);
  

  //add velocity to position
  //loc.x += vel.x;
  //loc.y += vel.y;
  loc.add(vel);
  loc2.add(vel2);
  
  //add acceleration to velocity
  vel.add(acc);
  vel.limit(5);
  
  vel2.add(acc2);
  vel2.limit(5);

  //wrap the ball's position
  //ball 1:
  if (loc.x >= width) {
    loc.x = 0;     
  } else if (loc.x  <= 0) {
    loc.x = width;
  }
  if (loc.y >= height) {
    loc.y = 0;
  } else if (loc.y <= 0) {
    loc.y = height;
  }
  //ball 2:  
    if (loc2.x >= width) {
    loc2.x = 0;     
  } else if (loc2.x  <= 0) {
    loc2.x = width;
  }
  if (loc2.y >= height) {
    loc2.y = 0;
  } else if (loc2.y <= 0) {
    loc2.y = height;
  }
}