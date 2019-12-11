
int[][] pos;

int size=50;

int size2=10;
int size3=30;


int X;
int Y;

void setup()
{
  size(200,200);
  background(75);
  
  pos=new int[6][6];
  
  for(int x=0; x<pos.length; x++)
  {
    for(int y=0; y<pos.length; y++)
    {
      pos[x][y]=int(random(4));
      println(pos[x][y]);
    }
  }
  println("####");
}

void draw()
{
  if(keyPressed==true)
  {
    if(key=='a')
    {
      X--;
    }
    if(key=='d')
    {
      X++;
    }
    if(key=='w')
    {
      Y--;
    }
    if(key=='s')
    {
      Y++;
    }
  }
  
  for(int x=0; x<pos.length; x++)
  {
    for(int y=0; y<pos.length; y++)
    {
      if(pos[x][y]==0)
      {
        fill(0,0,127);                  //blue
        rect(x*size,y*size,size,size);
  
        if(X+size2>x*size && X+size2<x*size+size)
        {
          if(Y+size3>y*size && Y+size3<y*size+size)
          {
            println(pos[x][y]);
          }
        }  
      }
      
      if(pos[x][y]==1)
      {
        fill(0,127,0);                    //green
        rect(x*size,y*size,size,size);
  
        if(X+size2>x*size && X+size2<x*size+size)
        {
          if(Y+size3>y*size && Y+size3<y*size+size)
          {
            println(pos[x][y]);
          }
        }  
      }
      
      
      if(pos[x][y]==2)
      {
        fill(127,0,0);                    //red
        rect(x*size,y*size,size,size);
  
        if(X+size2>x*size && X+size2<x*size+size)
        {
          if(Y+size3>y*size && Y+size3<y*size+size)
          {
            println(pos[x][y]);
          }
        }  
      }
      
      
      if(pos[x][y]==3)
      {
        fill(127,0,127);                    //purple
        rect(x*size,y*size,size,size);
  
        if(X+size2>x*size && X+size2<x*size+size)
        {
          if(Y+size3>y*size && Y+size3<y*size+size)
          {
            println(pos[x][y]);
          }
        }  
      }
    }
  }
     
  
  fill(75);
  rect(X,Y,size2*2,size3*2);
  point(X+size2,Y+size3);
}

  
