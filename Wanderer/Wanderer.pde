//declare variables
int count =20;
int mode;
float[] diam = new float [count];
float a=300;
float d=300;
int sze= 20;
PVector[] loc = new PVector [count];
PVector[] vel = new PVector [count];
PVector[] acc = new PVector [count];
float[] colorsr = new float[count]; 
float[] colorsg = new float[count];
float[] colorsb = new float[count];

void setup() {
  //set size of canvas
  size(800, 800);
  mode = 0;
  for( int i = 0; i < count; i++){
  //initialize variables
  
  loc[i] = new PVector(random(width),random(0,200));
  diam[i] = random(20,80);
  vel[i] = PVector.random2D();
  acc[i] = new PVector();
  acc[i].mult(1);
  
  //Adds color
  colorsr[i]= random(0,255);
  colorsg[i]= random(0,255);
  colorsb[i]= random(0,255);
  }
}

void draw() {
  
  if(mode==0){    //Opening screen
    
    background(255);
   
    //Opening text
    stroke(0);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    text("Press ENTER to begin",width/2,height/2);
    //smaller text
    textSize(20);
    text("Make sure to start mouse on ENTER",width/2, height-height/4);
    text("ESC to exit game",width/2,height-height/6);
    
  }
  if(mode==1){    //Game
    //draw background to cover previous frame
    background(255);
  
    //space where mouse starts and balls cannot initially go to.
    fill( 255, 100, 255);
    rect( a, d, 200, 200);
    
    //draws ellipse that follows mouse
    fill( 0 );
    ellipse( mouseX, mouseY, sze, sze);
    
    //removes cursor
    noCursor();
      
    for( int i = 0; i < count; i++){
      acc[i] = PVector.random2D();
  
      //Adds color
      fill(colorsr[i],colorsg[i],colorsb[i]);
      //draw ball
      ellipse(loc[i].x, loc[i].y , diam[i] , diam[i] );

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
      //if black ball touches others you go to loser page
      if(loc[i].x == mouseX && loc[i].y == mouseY){
        mode=3;
      } 
    }
  }
  //Losing page
  if (mode==3){
    background(0);
    textSize(100);
    text("You lose, shucks", width/2,height/2);
  }
}
void keyPressed(){
  if(keyCode==ESC){    //If ESC is pressed, exit program
    exit();
  }
  if(keyCode==ENTER){
    mode=1;
  }
  if(keyCode==BACKSPACE){
    mode=0;
  }
}