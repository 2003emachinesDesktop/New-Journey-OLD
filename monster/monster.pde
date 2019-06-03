//This works properly


GameWorld World;
Monster[] monsters=new Monster[2];

Sprite sprite;

int spriteXPos;
int spriteYPos;

int health=8;

int increment;

void setup()
{
  size(1200,900);
  //size(1200,900,JAVA2D);
  background(0);
  frameRate(30);
  
  for(int l=0; l<monsters.length; l++)
  {
    int w=int(random(4));
    int x=int(random(width-100));
    int y=int(random(height-200));
    int z=int(random(width-100));
    
    monsters[l]=new Monster(w,x,y,z);
  }
  
  for(int l=0; l<monsters.length; l++)
  {
    monsters[l].Load();
  }
  
  sprite=new Sprite(int(random(width)),int(random(height)));
  
  World=new GameWorld();
  World.Load();
  sprite.Load();
}


void draw()
{
  background(0);
  
  World.Draw();
  
  for(Monster l: monsters)
  {
    l.Update();
    l.Draw();
  }
  sprite.Move();
  
  
  increment++;
  
  /*if(increment/30==1)
  {
    second++;
    increment=0;
    
    if(second>=1)
    {
      second=0;
    }
  }
  */
  
  if(increment>31)
  {
    increment=0;
  }
  
  if(mousePressed==true)
  {
    if(health==0)
    {
      health=8;
      mousePressed=false;
    }
  }
  
  println(health);
}



class Monster
{ 
  int monsterWVal;
  int monsterXPos;
  int monsterYPos;
  int monsterZPos;
  
  PImage monster1;
  PImage monster2;
  PImage monster3;
  PImage monster4;
  
  float monsterRate=.03;
  
  int veiwSize=150;
  int monsterOffsetX;
  int monsterOffsetY;
  
  
  int Width=100;
  int Height=200;
  
  boolean InSight;
  boolean Collision;
  
  Monster(int w,int y,int x,int z)
  {
    monsterWVal=w;
    monsterXPos=y;
    monsterYPos=x;
    monsterZPos=z;
  }
  
  void Load()
  {
    monster1=loadImage("monster1.png");
    monster2=loadImage("monster2.png");
    monster3=loadImage("monster3.png");
    monster4=loadImage("monster4.png");
 
    InSight=false;
    Collision=false;
  }
  
  void Update()
  {
    monsterOffsetX=monsterXPos-veiwSize;
    monsterOffsetY=monsterYPos-veiwSize;

    if(spriteXPos+Width>monsterOffsetX && spriteXPos<monsterOffsetX+veiwSize)
    {
      if(spriteYPos+Height>monsterOffsetY && spriteYPos<monsterOffsetY+veiwSize)
      {
        InSight=true;
      }
    }
    
    
    if(InSight==true)
    {
       float targetX=spriteXPos;
       float dx=targetX-monsterXPos;
       monsterXPos+=dx*monsterRate;
       
       float targetY=spriteYPos;
       float dy=targetY-monsterYPos;
       monsterYPos+=dy*monsterRate;
       
       
       if(dx>veiwSize||dx<-veiwSize)
       {
         InSight=false;
       }
    
       if(dy>veiwSize||dy<-veiwSize)
       {
         InSight=false;
       }
     }
     
     
     if(InSight==false)
     {
       if(monsterZPos>monsterXPos)
       {
         monsterXPos++;
       }
       if(monsterZPos<monsterXPos)
       {
         monsterXPos--;
       }
       if(monsterZPos==monsterXPos)
       {
         monsterZPos=int(random(width-100));
       } 
     }
    
 
    if(spriteXPos+Width>monsterXPos && spriteXPos<monsterXPos+Width)
    {
      if(spriteYPos+Height>monsterYPos && spriteYPos<monsterYPos+Height)
      {
        Collision=true;
        println("Collision = true");
      }
    }
    
    if(Collision==true)
    {
      if(increment==30)
      {
        health--;
        //second=0;
        
        if(health<0)
        {
          health=0; 
        }
        Collision=false;
        //println("Collision is False");
      }
    }
  }

  
  
  void  Draw()
  {
    for(int i=0;i<monsters.length;i++)
    {
      if(monsterWVal==0)
      {
        image(monster1,monsterXPos,monsterYPos);
      }
      if(monsterWVal==1)
      {
        image(monster2,monsterXPos,monsterYPos);
      }
      if(monsterWVal==2)
      {
        image(monster3,monsterXPos,monsterYPos);
      }
      if(monsterWVal==3)
      {
        image(monster4,monsterXPos,monsterYPos);
      }
    }
  }
}

class GameWorld
{
  int worldSize=12;
  int[][] worldCoord;
  
  PImage tile2;
  PImage tile3;
  PImage tile4;
  PImage tile5;
  PImage tile6;
  
  GameWorld()
  {
  }
  
  void Load()
  {
    tile2=loadImage("tile1.png");
    tile3=loadImage("tile2.png");
    tile4=loadImage("tile3.png");
    tile5=loadImage("tile4.png");
    tile6=loadImage("tile5.png");
    
    randomSeed(3);
    
    worldCoord=new int[worldSize][worldSize];
    
    for(int i=0; i<worldSize; i++)
    {
      for(int k=0; k<worldSize; k++)
      {
        worldCoord[i][k]=int(random(10));
      }
    }
  }
  
  void Draw()
  {
    for(int i=0; i<worldSize; i++)
      {
        for(int k=0; k<worldSize; k++)
        {
          if(worldCoord[i][k]==5)
          {
           image(tile2,i*100,k*100);
          }
          if(worldCoord[i][k]==6)
          {
            image(tile3,i*100,k*100);
          }
          if(worldCoord[i][k]==7)
          {
            image(tile4,i*100,k*100);
          }
          if(worldCoord[i][k]==8)
          {
            image(tile5,i*100,k*100);
          }
          if(worldCoord[i][k]==9)
          {
            image(tile6,i*100,k*100);
          }
        }
      }
  }
}


class Sprite
{
  PImage sprite;
  PImage sprite2;
  
  int XPos;
  int YPos;
  
  
  Sprite(int tempXPos,int tempYPos)
  {
    XPos=tempXPos;
    YPos=tempYPos;
  }


  void Load()
  {
    sprite=loadImage("guy.png");
    sprite2=loadImage("guy2.png");
  }


  void Move()
  {
    if(keyPressed==true)
    {
      if(key=='w')
      {
        spriteYPos-=25;
        keyPressed=false;
      }
      if(key=='s')
      {
        spriteYPos+=25;
        keyPressed=false;
      }
      if(key=='a')
      {
        spriteXPos-=25;
        keyPressed=false;
      }
      if(key=='d')
      {
        spriteXPos+=25;
      }
      if(key=='q')
      {
        //openInventory();
      }
      if(key==CODED)
      {/*
        if(keyCode==SPACE)
        {
          spriteJump();
        }*/
        if(keyCode==SHIFT)
        {
          //spriteAttack();
        }
      }
    }

    if(health>0)
    {
      image(sprite,spriteXPos,spriteYPos);
    }
    if(health==0)
    {
      image(sprite2,spriteXPos,spriteYPos);
    }
  }
}


    
    
  
  
