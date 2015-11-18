int count = 8; 

//declare variables
PVector [] loc = new PVector [count]; 
PVector [] vel = new PVector [count]; 
PVector [] a = new PVector [count]; 
float [] diam = new float [count];

void setup() {
  //set size of canvas
  size(800, 600);
  for (int i = 0; i < count; i++) {
    //initialize variables
    loc [i] = new PVector (random(width), random(height)); 
    diam [i] = random(10, 80);
    vel[i] = PVector.random2D();
    vel[i].mult(1); 
  }
}

void draw() {
  for (int i = 0; i < count; i ++) {
     
    //draw background to cover previous frame
    background(204, 240, 229);
    stroke(random(237), random(250), random(246));
    strokeWeight(3); 

    //draw ball
    ellipse(loc[i].x, loc[i].y, diam[i], diam[i]);
    a[i] = PVector.random2D(); 
    a[i].mult(0.1);

    //add velocity to position
    loc[i].add(vel[i]); 
    vel[i].add(a[i]); 
    vel[i].limit(10); //limits velocity to 


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