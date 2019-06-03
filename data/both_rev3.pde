int worldSize=200;

int width=1920;
int height=1080;

int XPos;
int YPos;

Sprite Darvin;
GameWorld World;


void setup()
{
  fullScreen(JAVA2D);
  background(0);
  frameRate(25);
  noCursor();
  
  randomSeed(0);
  
  World=new GameWorld(worldSize,0);
  Darvin=new Sprite('r',width/2,height/2+100,true,worldSize);
  
  World.Load();
  Darvin.Load();
}


void draw()
{
  World.Run(XPos,YPos);
  int XPos,YPos=Darvin.Move();
  
  if(keyPressed)
  {
    if(key==CODED)
    {
      if(keyCode==ESC)
      {
        exit();
      }
    }
  }
}


class Sprite
{
  PImage spriteR;
  PImage spriteL;
  PImage spriteDead;
  
  char spriteShowing;
  
  int XPos;
  int YPos;
  
  int worldWidth;
  int worldHeight;
  
  boolean spriteAlive;
  
  
  Sprite(char tempSpriteShowing,int tempXPos,int tempYPos,boolean tempSpriteAlive,
         int tempWorldSize)
  {
    spriteShowing=tempSpriteShowing;
    XPos=tempXPos;
    YPos=tempYPos;
    spriteAlive=tempSpriteAlive;
    worldSize=tempWorldSize;    
  }


void Load()
{
  spriteR=loadImage("guyR.png");
  spriteL=loadImage("guyL.png");
  spriteDead=loadImage("guyDead.png");
}


int Move(int XPos,int YPos)
{
  if(keyPressed==true)
  {
    if(key=='a')
    {
      XPos-=25;
      keyPressed=false;
    }
    if(key=='d')
    {
      XPos+=25;
      keyPressed=false;
    }
    if(key=='w')
    {
      YPos-=25;
      keyPressed=false;
    }
    if(key=='s')
    {
      YPos+=25;
      keyPressed=false;
    }
    return XPos;
    return Ypos;
  }

  
  
  if(XPos<0 || XPos>worldSize*100-98)
  {
    spriteAlive=false;
    println("you died");
  }
  if(YPos<0 || YPos>worldSize*100-98)
  {
    spriteAlive=false;
    println("you died");
  }
  
  
  if(spriteAlive==true)
  {
    if(spriteShowing=='r')
    {
      image(spriteR,XPos,YPos);
    }
    
  }
  
  if(spriteAlive==false)
  {
    background(100,9,21);
    image(spriteDead,width/2-98,height/2-49);
  }
}

}




class GameWorld
{
  int Xpos;
  int Ypos;
  
  int[][] coord;

  PImage grass0;
  PImage grass1;
  PImage grass2;
  PImage tile1;
  PImage tile2;
  PImage guy;

  int range;
  
  
  GameWorld(int tempWorldSize,int tempRange)
  {
    Xpos=tempWorldSize;
    Ypos=tempWorldSize;
    range=tempRange;
  }
  
  void Load()
  {
    grass0=loadImage("grass0.png");
    grass1=loadImage("grass1.png");
    grass2=loadImage("grass2.png");
    tile1=loadImage("tile1.png");
    tile2=loadImage("tile2.png");
    
    coord=new int[Xpos][Ypos];
    
    randomSeed(range);
    
    for(int i=0; i<Xpos; i++)
    {
      for(int k=0; k<Ypos; k++)
      {
        coord[i][k]=int(random(5));
      }
    }
  }
  
  void Run(int XLoc,int YLoc)
  {
    background(81,126,39);
    
    translate(XLoc,YLoc);
    {
      for(int i=0; i<Xpos; i++)
      {
        for(int k=0; k<Ypos; k++)
        {
          if(coord[i][k]==0)
          {
           image(grass0,i*100,k*100);
          }
          if(coord[i][k]==1)
          {
            image(grass1,i*100,k*100);
          }
          if(coord[i][k]==2)
          {
            image(grass2,i*100,k*100);
          }
          if(coord[i][k]==3)
          {
            image(tile1,i*100,k*100);
          }
          if(coord[i][k]==4)
          {
            image(tile2,i*100,k*100);
          }
        }
      }
   }
 }
  
}
  
