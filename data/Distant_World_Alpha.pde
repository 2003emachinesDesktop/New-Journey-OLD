        
PImage startScreen;
PImage menuScreen;
PImage loadingScreen;
PImage playScreen;
PImage newScreen;
PImage optionsScreen;

PFont font;

boolean gameStart=false;
boolean menuStart=true;

GameWorld World;
Sprite Player;

Monsters[] monsters=new Monsters[48];

final int worldSize=300;
final int tileSprite=100;

int spriteXPos;
int spriteYPos;


void setup()
{
  //fullScreen(JAVA2D);
  size(1650,850,JAVA2D);
  background(0,0,0);
  frameRate(30);
  
  startScreen=loadImage("start.png");
  image(startScreen,0,0);
  
  menuScreen=loadImage("menu.png");
  loadingScreen=loadImage("loading.png");
  playScreen=loadImage("play.png");
  newScreen=loadImage("new.png");
  optionsScreen=loadImage("options.png");
  
  World=new GameWorld();
  Player=new Sprite(int(random(worldSize*100)),int(random(worldSize*100)));
  
  for(int l=0; l<monsters.length; l++)
  {
    int x=int(random(worldSize*100-100));
    int y=int(random(worldSize*100-200));
    int z=int(random(worldSize*100-100));
    
    monsters[l]=new Monsters(x,y,z);
    //println(x/100+", "+y/100+", "+z);
  }
  
  font=createFont("consolab.ttf",32);
  textFont(font);
  text("Press Any Key To Start",600,750);
}



void draw()
{
  if(menuStart==true)
  {
    menu();
  }
  
  if(gameStart==true)
  {
      Player.Update();
  
      for(Monsters l: monsters)
      {
        l.Update();
      }
  
      World.Draw();
      Player.Draw();
  
      for(Monsters l: monsters)
      {
        l.Draw();
      }
  }
}



void menu()
{
  if(keyPressed==true)
  {
    image(menuScreen,0,0);
    
    if(key==CODED && keyCode==BACKSPACE)
    {
      menu();
      keyPressed=false;
    }
  }
  
  if(mousePressed==true)
  {
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>256 && mouseY<377)
      {
        image(playScreen,0,0);
        
        World.Load();
        Player.Load();
  
        for(int l=0; l<monsters.length; l++)
        {
          monsters[l].Load();
        }
        
        
        Player.Update();
  
        for(Monsters l: monsters)
        {
          l.Update();
        }
  
        World.Draw();
        Player.Draw();
  
        for(Monsters l: monsters)
        {
         l.Draw();
        }
        
        gameStart=true;
        menuStart=false;
      }
    }
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>415 && mouseY<537)
      {
        image(newScreen,0,0);
        //GameWorld.BuildNew();
        
        gameStart=true;
        menuStart=false;
      }
    }
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>569 && mouseY<537)
      {
        image(optionsScreen,0,0);
        //GameWorld.Controles();
        
        gameStart=true;
        menuStart=false;
      }
    }
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>724 && mouseY<690)
      {
        exit();
      }
    }
  }
}
        


  
