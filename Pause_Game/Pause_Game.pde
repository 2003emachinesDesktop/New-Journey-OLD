
Boolean paused=false;
int x;

void setup()
{
  size(500,400);
  background(98,61,201);
  
}

void draw()
{
  if(paused==false)
  {
    x=int(random(9));
    println(x);
  }
}

void mousePressed()
{
  if(mousePressed && paused==false)
  {
    paused=true;
    mousePressed=false;
  }
  if(mousePressed && paused==true)
  {
    paused=false;
    mousePressed=false;
  }
}
