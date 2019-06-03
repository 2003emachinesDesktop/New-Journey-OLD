        
PImage startScreen;
PImage menuScreen;
PImage loadingScreen;
PImage playScreen;
PImage newScreen;
PImage optionsScreen;

PFont font1;
PFont font2;

boolean gameStart=false;
boolean menuStart=true;

GameWorld World;
Sprite Player;

Monsters[] monsters=new Monsters[128];

final int worldSize=300;
final int tileSprite=100;

int spriteXPos;
int spriteYPos;

int health=8;

String input;

Boolean gameState=false;

boolean gameLoaded=false;
boolean fileLoaded=false;


void setup()
{
  //fullScreen(JAVA2D);
  size(1650,850,JAVA2D);
  background(0,0,0);
  frameRate(60);
  
  startScreen=loadImage("start.png");
  image(startScreen,0,0);
  
  menuScreen=loadImage("menu.png");
  loadingScreen=loadImage("loading.png");
  playScreen=loadImage("play.png");
  newScreen=loadImage("new.png");
  optionsScreen=loadImage("options.png");
  
  World=new GameWorld();
  Player=new Sprite();
  
  for(int l=0; l<monsters.length; l++)
  {
    int w=int(random(4));
    int x=int(random(worldSize*100-100));
    int y=int(random(worldSize*100-200));
    int z=int(random(worldSize*100-100));
    
    monsters[l]=new Monsters(w,x,y,z);
  }
  
  font1=createFont("consolab.ttf",32);
  font2=createFont("consolab.ttf",10);
  textFont(font1);
  text("Press Anything To Start",600,750);
  
  //gameState=true;
}



void draw()
{
  if(menuStart==true)
  {
    menu();
  }
  
  if (gameLoaded == false && fileLoaded==true) 
  {
    World.Load();
    gameLoaded = true;
    gameState=true;
  }
  
  if(gameStart==true)
  {
    if(gameState==true)
    {
      //scale(.75);
      
      World.Update();
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
  
  if(keyPressed==true)
  {
    if(key=='p' && gameState==true)
    {
      println("paused");
      gameState=false;
      
        
      translate(0,0);
      text("Game Paused",50,50);
      
      keyPressed=false;
    }
  }
    
  if(keyPressed==true)
  { 
    if(key=='p' && gameState==false)
    {
      println("started");
      gameState=true;
      
      translate(0,0);
      text("Game Running",50,50);
      
      keyPressed=false;
    }
  }
}



void menu()
{
  if(keyPressed==true)
  {
    image(menuScreen,0,0);
    textFont(font2);
    text("BETA Version 0.1.1",20,height-40);
  }
    
    if(key==CODED && keyCode==BACKSPACE)
    {
      menu();
      keyPressed=false;
    }
  
  
  if(mousePressed==true)
  {
    //println(mouseX+"; "+mouseY);
    
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>256 && mouseY<377)
      {
        
        image(playScreen,0,0);
        
        //World.Load();
        Player.Load();
  
        for(int l=0; l<monsters.length; l++)
        {
          monsters[l].Load();
        }
        
        selectInput("Select A Game Save:", "fileSelected");
        
        gameStart=true;
        menuStart=false;
      }
    }
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>415 && mouseY<537)
      {
        image(newScreen,0,0);
        textFont(font1);
       // text("Sorry! This Option Isn't Avaliable Right Now.",20,height-40);
        //GameWorld.BuildNew();
        launch("home/pi/Sketchbook/Processing/New_Journey_Beta/data/application.linux-arm64/create_world.txt");
        
        gameStart=false;
        menuStart=false;
      }
    }
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>568 && mouseY<670)
      {
        image(optionsScreen,0,0);
        text("Sorry! This Option Isn't Avaliable Right Now.",20,height-40);
        //GameWorld.Controles();
        
        gameStart=false;
        menuStart=false;
      }
    }
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>711 && mouseY<814)
      {
        exit();
      }
    }
  }
}


void fileSelected(File selection) 
{
  if (selection == null) 
  {
    println("Nothing was selected, so nothing happens");
  } 
  else 
  {
    input = selection.getAbsolutePath();
    //rows=loadStrings(input);
    fileLoaded=true;
  }
}

  
