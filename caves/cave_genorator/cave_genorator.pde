
int x=50;
int y=50;

int length=50;

int var;


void setup()
{
  size(750,750);
  background(100);
  
  stroke(150);
  strokeWeight(25);
  strokeCap(ROUND);
}



void draw()
{
  for(int i=0; i<30; i++)
  {
     var=int(random(4));
     println(var);
  
    if(var==0)
    {
      line(x,y,x+length,y);
      x+=length;
    }
    if(var==1)
    {
      line(x,y,x,y+length);
      y+=length;
    }
    if(var==2)
    {
      line(x/2,y,x+length,y);
      x+=length;
    }
    if(var==3)
    {
      line(x,y/2,x,y+length);
      y+=length;
    }
  }
}
