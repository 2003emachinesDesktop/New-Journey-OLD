int x;
int y;

boolean d;
boolean p;

void setup()
{
  size(400,300);
  background(0);
  frameRate(30);
  
  y=100;
  d=false;
  p=false;
}

void draw()
{
  background(0,y,y/3);
  println(y);
  
  timer();
}


void timer()
{
   x++;
  
  if(d==false && p==false)                //dawn
  {
    if(x/30==1)
    {
      y++;
      
      x=0;
      
      if(y==255)
      {
        d=true;
        p=true;
      }
    }
  }
  if(d==true && p==true)                  //day
  {
    if(x/30==10)
    {
      x=0;
      
      p=false;
    }
  }
  if(d==true && p==false)                //twilight
  {
    if(x/30==1)
    {
      y--;
      
      x=0;
      
      if(y==0)
      {
        d=false;
        p=true;
      }
    }
  }
  if(d==false && p==true)
  {
    if(x/30==10)
    {
      x=0;
      
      p=false;
    }
  }
}
