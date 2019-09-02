
int size=20;

int x=120;
int y=200;

int oldx;
int oldy;

boolean c=false;

void setup()
{
  size(400,400);
  background(100);
}


void draw()
{
  background(100);
  
  fill(175);
  rect(100,150,200,100);
  
  fill(25);
  rect(x,y,size,size);
 
 
 
  if(keyPressed==true)
  {
    if(c==false)
    {
      if(key=='a')
      {
        x--;
      }
      if(key=='d')
      {
        x++;
      }
      if(key=='w')
      {
        y--;
      }
      if(key=='s')
      {
        y++;
      }
      
      oldx=x;
      oldy=y;
      
    }
  }
  
  if((x<=100 || x+size>=300) || (y<=150 || y+size>=250))
  {
    c=true;
    println("collision "+x+" ; "+y);
  }
  
  if(c==true)
  {
    if(x<=100)
    {
      x=oldx;
      x+=2;
    }
    if(x+size>=300)
    {
      x=oldx;
      x-=2;
    }
    
    if(y<=150)
    {
      y=oldy;
      y+=2;
    }
    if(y+size>250)
    {
      y=oldy;
      y-=2;
    }
    
    c=false;
  }
}
