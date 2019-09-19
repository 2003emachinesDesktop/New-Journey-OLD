
PImage  caveMap;

boolean collision=false;

int size=40;

int x=20;
int y=20;

int oldX=x;
int oldY=y;

color colour1=color(18,18,18);
 
 
void setup()
{
  size(1000,600);
  background(0);
  
  caveMap=loadImage("cave.png");
}

void draw()
{
  background(caveMap);
  
  noStroke();
  fill(50);
  rect(x,y,size,size);
  
  println(x+" ; "+y);
  
  
  if(collision==true)
  {
    if(x>=oldX)
    {
      oldX=x;
    }
    if(y>=oldY)
    {
      oldY=y;
    }
    collision=false;
  }
    
    
  if(collision==false)
  {
    oldX=x;
    oldY=y;
  
  
    if(keyPressed==true)
    {
      if(key=='w')
      {
        y-=5;
        oldY=y;
      }
      if(key=='s')
      {
        y+=5;
        oldY=y;
      }
  
      if(key=='a')
      {
        x-=5;
        oldX=x;
      }
      if(key=='d')
      {
        x+=5;
        oldX=x;
      }
    }
  }
  
  color colour2=get(x,y);
  color colour3=get(x+40,y+40);
  color colour4=get(x+40,y);
  color colour5=get(x,y+40);
  
  if(colour2==colour1 || colour3==colour1 || colour4==colour1 ||colour5==colour1)
  {
    if((key=='w') && (colour2==colour1 || colour4==colour1))
    {
       collision=true;
       y+=5;
    }
    if((key=='s') && (colour3==colour1 || colour5==colour1))
    {
       collision=true;
       y-=5;
    }
    if((key=='a') && (colour2==colour1 || colour5==colour1))
    {
       collision=true;
       x+=5;
    }
    if((key=='d') && (colour3==colour1 || colour4==colour1))
    {
       collision=true;
       x-=5;
    }
   
  }
}



  
