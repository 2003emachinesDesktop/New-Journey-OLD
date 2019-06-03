
int WIDTH=300;
int HEIGHT=260;
int SIZE=20;

int gravity=2;

int posX=140;
int posY=180;
int oldY=posY;
int yVelocity;
int jumpHeight=-20;


void setup()
{
  size(300,260);
  //fullScreen();
  frameRate(30);
  background(255);
}

void draw()
{
  //translate(400,400);
  background(255);
   
  yVelocity+=gravity;
  posY+=yVelocity;
  
  if(posY>oldY)
  {
    posY=oldY;
  }
  
  //oldY=posY;
  
  fill(0);
  
  stroke(1);
  line(0,posY,width,posY);
   
  rect(posX,posY,SIZE,SIZE);
  
  if(keyPressed==true)
  {
    if(key=='a')
    {
      posX-=2;
    }
    if(key=='d')
    {
      posX+=2;
    }
    if(key=='w')
    {
      gravity=0;
      yVelocity=0;
      
      posY-=2;
      oldY=posY;
      
      keyPressed=false;
    }
    if(key=='s')
    {
      gravity=0;
      yVelocity=0;
      
      posY+=2;
      oldY=posY;
      
      keyPressed=false;
    }
    if(key==' ')
    {
      posY=oldY; 
      
      gravity=2;
      yVelocity=0;
       
      yVelocity=jumpHeight; 
      keyPressed=false;
    }
  }
}

    
    
