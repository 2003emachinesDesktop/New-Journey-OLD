
class GameWorld
{
  int worldSize=300;
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
    background(81,126,39);
    
    translate(-spriteXPos,-spriteYPos);

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
  }


  void Update()
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
    
    if(spriteXPos<0)
    {
      spriteXPos=0;
    }
    if(spriteXPos>worldSize*100)
    {
      spriteXPos=worldSize*100;
    }
    if(spriteYPos<0)
    {
      spriteYPos=0;
    }
    if(spriteYPos>worldSize*100)
    {
      spriteYPos=worldSize*100;
    }
  }
  
  /*
   if(XPos<0 || XPos>width)
   {
     spriteAlive=false;
     println("you died");
   }
   if(YPos<0 || YPos>height)
   {
     spriteAlive=false;
     println("you died");
   }
    
  
  if(spriteAlive==true)
  {
    if(changing==true)
    {
      image(spriteR,XPos,YPos);
      changing=false;
      println(changing);
    }
    if(changing==false)
    {
      image(spriteL,XPos,YPos);
      changing=true;
      println(changing);
    }
  }
  
  
  if(spriteAlive==false)
  {
    background(170,7,45);
    XPos=width/2;
    YPos=height/2;
    image(spriteDead,XPos,YPos);
  }
}
*/
  void Draw()
  {
    translate(width/2-45,height/2-98);
    image(sprite,spriteXPos,spriteYPos);
  }
}



class Monsters
{
  int monsterXPos;
  int monsterYPos;
  int monsterZPos;
  
  PImage monster;
  PImage sprite;
  
  float monsterRate=.06;
  
  int veiwSize=250;
  int monsterOffsetX;
  int monsterOffsetY;
  
  
  int Width=100;
  int Height=200;
  
  boolean InSight;
  boolean Following;
  boolean Collision;
  
  Monsters(int u,int v,int w)
  {
    monsterXPos=u;
    monsterYPos=v;
    monsterZPos=w;
  }
  
  void Load()
  {
    monster=loadImage("monster.png");
 
    InSight=false;
    Following=false;
    Collision=false;
  }
  
  void Update()
  {
    
    monsterOffsetX=monsterXPos-120;
    monsterOffsetY=monsterYPos-120;

    if(spriteXPos+Width>monsterOffsetX && spriteXPos<monsterOffsetX+veiwSize)
    {
      if(spriteYPos+Height>monsterOffsetY && spriteYPos<monsterOffsetY+veiwSize)
      {
        InSight=true;
      }
    }
    
    if(spriteXPos+Width>monsterXPos && spriteXPos<monsterXPos+Width)
    {
      if(spriteYPos+Height>monsterYPos && spriteYPos<monsterYPos+Height)
      {
        Collision=true;
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
       
       
      if(dx>veiwSize || dx<-veiwSize)
      {
        InSight=false;
      }
    
      if(dy>veiwSize|| dy<-veiwSize)
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
  }
  
  void  Draw()
  {
    image(monster,monsterXPos,monsterYPos);
  }
}
            
