Sprite Darvin;
GameWorld World;


void setup()
{
  size(800,700);
  background(81,126,39);
  frameRate(4);
  
  World=new GameWorld(0,0);
  Darvin=new Sprite('r',width/2,height/2,true);
  
  World.Load();
  Darvin.Load();
  
  World.Run();
}


void draw()
{
  if(keyPressed==true)
  {
    World.Run();
    Darvin.Move();
    keyPressed=false;
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
  
  boolean spriteAlive;
  
  
  Sprite(char tempSpriteShowing,int tempXPos,int tempYPos,boolean tempSpriteAlive)
  {
    spriteShowing=tempSpriteShowing;
    XPos=tempXPos;
    YPos=tempYPos;
    spriteAlive=tempSpriteAlive;
}


void Load()
{
  spriteR=loadImage("guyR.png");
  spriteL=loadImage("guyL.png");
  spriteDead=loadImage("guyDead.png");
}


void Move()
{
  if(keyPressed==true)
  {
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
    if(key=='a')
    {
      XPos-=25;
      keyPressed=false;
    }
    if(key=='d')
    {
      XPos+=25;
    }
  }
  
  
  if(XPos<0 || XPos>width-98)
  {
    spriteAlive=false;
    println("you died");
  }
  if(YPos<0 || YPos>height-98)
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
    background(203,14,21);
    XPos=width/2;
    YPos=height/2;
    image(spriteDead,XPos,YPos);
  }
}

}


class GameWorld
{
  PImage grass1;
  PImage grass2;
  PImage grassFlowers;
  PImage grassRocks;
  
  String saveData[];
  
  int worldXPos;
  int worldYPos;
  
  int Xpos;
  int Ypos;
  
  
  GameWorld(int tempWorldXPos,int tempWorldYPos)
  {
    worldXPos=tempWorldXPos;
    worldYPos=tempWorldYPos;
  }
  
  
void Load()
{
  grass1=loadImage("grass1.png");
  grass2=loadImage("grass2.png");
  grassFlowers=loadImage("tile1.png");
  grassRocks=loadImage("tile2.png");
  
  saveData=loadStrings("save_file.txt");
}


void Run()
{
  translate(50,25);
  
  println("starting");
    for(String x: saveData)
    {
      if(x.equals("0"))
      {
        image(grass1,Xpos,Ypos);
        Xpos+=100;
        if(Xpos>600)
        {
          Ypos+=100;
          Xpos=0;
        }
      }
      if(x.equals("1"))
      {
        image(grass2,Xpos,Ypos);
        Xpos+=100;
        if(Xpos>600)
        {
          Ypos+=100;
          Xpos=0;
        }
      }
      if(x.equals("2"))
      {
        image(grassFlowers,Xpos,Ypos);
        Xpos+=100;
        if(Xpos>600)
        {
          Ypos+=100;
          Xpos=0;
        }
      }
      if(x.equals("3"))
      {
        image(grassRocks,Xpos,Ypos);
        Xpos+=100;
        if(Xpos>600)
        {
          Ypos+=100;
          Xpos=0;
        }
      }
  } 
}

}