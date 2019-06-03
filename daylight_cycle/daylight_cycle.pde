
int colour;
int increment;

void setup()
{
  size(800,500,JAVA2D);
  background(5,85,4);
  frameRate(30);
  noStroke();
}

void draw()
{
  fill(0,colour/2,colour);
  rect(0,0,width,100);
  
  increment++;
  
  if(increment/30==1)
  {
    colour++;
    
    increment=0;
    
    if(colour==255)
    {
      colour=0;
    }
  }
}
