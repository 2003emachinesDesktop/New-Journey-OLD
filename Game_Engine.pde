
class GameWorld
{
  int worldSize=300;
  int[][] worldCoord;
  
  String columns[];
  String rows[];
  
  PImage tile2;
  PImage tile3;
  PImage tile4;
  PImage tile5;
  PImage tile6;
  PImage tile7;
  PImage tile8;
  
  boolean d;
  boolean p;
  
  int x;
  int y;
  
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
    tile7=loadImage("tree.png");
    tile8=loadImage("tree2.png");
    
    //rows=loadStrings("game_save.txt");
    rows = loadStrings(input);
    
    columns=splitTokens(rows[1]);
    
    worldCoord=new int[rows.length][columns.length];
    
    for(int a=0; a<rows.length; a++)
    {
      columns=splitTokens(rows[a]);
    
      for(int b=0; b<columns.length; b++)
      {
         worldCoord[a][b]=Integer.parseInt(columns[b]);
      }
    }
  }
  
  void Update()
  {
     background(0,y,y/3);
    
     x++;
  
     if(d==false && p==false)                //dawn
     {
       if(x/60==1)
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
       if(x/60==10)
       {
         x=0;
      
         p=false;
       }
     }
     if(d==true && p==false)                //twilight
     {
       if(x/60==1)
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
       if(x/60==10)
       {
         x=0;
      
         p=false;
       }
     }
   }
  
  void Draw()
  {
    translate(-spriteXPos,-spriteYPos);

    for(int i=0; i<rows.length; i++)
    {
      for(int k=0; k<columns.length; k++)
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
      
     for(int i=0; i<rows.length; i++)
     {
       for(int k=0; k<columns.length; k++)
       {
         if(worldCoord[i][k]==10)
         {
           image(tile7,i*100,k*100);
         }
         if(worldCoord[i][k]==11)
         {
           image(tile8,i*100,k*100);
         }
       }
     }
   }
}


class Sprite
{
  PImage sprite;
  PImage sprite2;
  
  int oldSpriteY;
  int gravity=4;
  
  int yVelocity;
  int jumpHeight=-25;
  
  
  Sprite()
  {
  }


  void Load()
  {
    sprite=loadImage("guy.png");
    sprite2=loadImage("guy2.png");
  }


  void Update()
  {
    yVelocity+=gravity;
    spriteYPos+=yVelocity;
  
    if(spriteYPos>oldSpriteY)
    {
      spriteYPos=oldSpriteY;
    }
    
     if(keyPressed==true)
    {
      if(key=='w')
      {
        gravity=0;
        yVelocity=0;
        
        spriteYPos-=20;
        oldSpriteY=spriteYPos;
        keyPressed=false;
      }
      if(key=='s')
      {
        gravity=0;
        yVelocity=0;
        
        spriteYPos+=20;
        oldSpriteY=spriteYPos;
        keyPressed=false;
      }
      if(key=='a')
      {
        spriteXPos-=20;
        keyPressed=false;
      }
      if(key=='d')
      {
        spriteXPos+=20;
        keyPressed=false;
      }
      if(key==' ')
      {
        spriteYPos=oldSpriteY;
        
        gravity=4;
        yVelocity=0;
        
        yVelocity=jumpHeight;
        keyPressed=false;
      }
      
      if(key=='q')
      {
        textFont(font2);
        text("The WASD keys control player movement", width-300,20);
        text("The Space key makes the player jump",width-300,50);
        text("The ESC key will close the game",width-300,80);
        text("The P key will pause/unpause the game",width-300,110);
      }
      if(key==CODED)
      {
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
  */

  void Draw()
  {
    
    if(health>0)
    {
      translate(width/2-100,height/2-98);  
      image(sprite,spriteXPos,spriteYPos);
    }
    if(health==0)
    {
      translate(width/2,height/2); 
      //translate(width/2-45,height/2-98);  
      image(sprite2,spriteXPos,spriteYPos);
    }
  }
}



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
  boolean Following;
  boolean Collision;
  
  int increment;
  
  Monsters(int w, int x,int y,int z)
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
            
