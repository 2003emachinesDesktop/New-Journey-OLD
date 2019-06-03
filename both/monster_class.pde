class Monsters
{
  int monsterWVal;
  int monsterXPos;
  int monsterYPos;
  int monsterZPos;
  
  PImage monster1;
  PImage monster2;
  PImage monster3;
  PImage monster4;
  
  float monsterRate=.06;
  
  int veiwSize=250;
  int monsterOffsetX;
  int monsterOffsetY;
  
  
  int Width=100;
  int Height=200;
  
  boolean InSight;
  boolean Collision;
  
  int increment;
  int second;
  
  Monsters(int w,int x,int y,int z)
  {
    monsterWVal=w;
    monsterXPos=x;
    monsterYPos=y;
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
    increment++;
  
    /*
    if(increment/60==1)
    {
      second++;
      increment=0;
    }
    */
    
    if(increment>31)
    {
      increment=0;
      println(health);
    }
    
    if(mousePressed==true)
    {
      if(health==0)
      {
        health=8;
        mousePressed=false;
      }
    }
    
    monsterOffsetX=monsterXPos-120;
    monsterOffsetY=monsterYPos-120;

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
