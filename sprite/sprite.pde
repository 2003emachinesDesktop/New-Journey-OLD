
Sprite Darvin;

int [] Inventory;

int gravity=3;
int posX;
int posY;
int oldY=posY;
int yVelocity;
int jumpHeight=-20;

int health=8;


Boolean openInventory=false;

void setup()
{
  size(1200,800);
  background(1,118,23);
  frameRate(30);
  
  Inventory=new int[20];
  
  posX=width/2;
  posY=height/2;
  
  Darvin=new Sprite(posX,posY,true);
  
  Darvin.Load();
}

void draw()
{
  Darvin.Update();
  Darvin.Draw();
}


class Sprite
{
  PImage spriteR;
  PImage spriteL;
  PImage spriteDead;
  PImage inventoryMenu;
  
  boolean changing=false;
  
  
  boolean spriteAlive=true;
  
  
  Sprite(int tempXPos,int tempYPos,boolean tempSpriteAlive)
  {
    posX=tempXPos;
    posY=tempYPos;
    spriteAlive=tempSpriteAlive;
}


void Load()
{
  spriteR=loadImage("guyR.png");
  spriteL=loadImage("guyL.png");
  spriteDead=loadImage("guyDead.png");
  inventoryMenu=loadImage("menu.png");
}


void Update()
{
  yVelocity+=gravity;
  posY+=yVelocity;
  
  if(posY>oldY)
  {
    posY=oldY;
  }
  
  if(keyPressed==true)
  {
    if(key=='w')
    {
      gravity=0;
      yVelocity=0;
      
      posY-=15;
      oldY=posY;
    }
    if(key=='s')
    {
      gravity=0;
      yVelocity=0;
      
      posY+=15;
      oldY=posY;
    }
    if(key=='a')
    {
      posX-=15;
    }
    if(key=='d')
    {
      posX+=15;
    }
     if(key==' ')
     {
       posY=oldY; 
      
       gravity=2;
       yVelocity=0;
       
       yVelocity=jumpHeight; 
     }
     if(key=='i')
     {
       openInventory=true;
      
       if(openInventory==true)
       {
         openInventory();
         //keyPressed=false;
       }
     }
     if(key==CODED)
     {
       if(keyCode==BACKSPACE)
       {
         println("check");
         spriteAlive=true;
       }
       if(keyCode==SHIFT)
       {
         spriteAttack();
       }
     }
   }
   
  if(posX<0)
  {
    posX=0;
  }
  if(posX>width-98)
  {
    posX=width-98;
  }
  
  if(posY<0)
  {
    posY=0;
  }
  if(posY>height-188)
  {
    posY=height-188;
  }
}

void Draw()
{  
  if(health>0)
  {
    background(1,118,23);
    image(spriteR,posX,posY);
  }
  
  if(health==0)
  {
    posX=width/2;
    posY=height/2;
    background(200,0,15);
  }
}

void openInventory()
{
  if(openInventory==true)
  { 
   image(inventoryMenu,width/2-200,height/2-250);
  }
}
  
void spriteAttack()
{
  
}

}
  
