
GameWorld World;
Sprite Player;
Caves Cave;

Monsters[] monsters=new Monsters[128];


int worldSize=300;
int tileSize=100;

int spriteXPos;
int spriteYPos;

int health=8;

String input;

boolean GameState=false;
boolean CaveState=false;

boolean gameLoaded=false;
boolean fileLoaded=false;

void setup()
{
  //fullScreen(JAVA2D);
  size(1650,850,JAVA2D);
  background(0);
  frameRate(60);
  
  World=new GameWorld();
  
  Player=new Sprite();
  
  Cave=new Caves();
  
  
  for(int l=0; l<monsters.length; l++)
  {
    int w=int(random(4));
    int x=int(random(worldSize*100-100));
    int y=int(random(worldSize*100-200));
    int z=int(random(worldSize*100-100));
    
    monsters[l]=new Monsters(w,x,y,z);
  }
  
  //World.Load();
  Player.Load();
  
  for(int l=0; l<monsters.length; l++)
  {
    monsters[l].Load();
  }
  
  selectInput("Select A Game Save:", "fileSelected");
  
  //GameState=true;
}


void draw()
{
  if (gameLoaded == false && fileLoaded==true) 
  {
    World.Load();
    gameLoaded = true;
    GameState=true;
  }
  
  if(GameState==true)
  {
    //scale(.70);
    
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
  
  if(CaveState==true)
  {
    GameState=false;
    
    Cave.Load();
    
    if(CaveState==true)
    {
      Cave.Run();
    }
  }
  
    
  
  if(keyPressed==true)
  {
    if(key=='p' && GameState==true)
    {
      println("paused");
      GameState=false;
      keyPressed=false;
    }
  }
    
  if(keyPressed==true)
  { 
    if(key=='p' && GameState==false)
    {
      println("started");
      GameState=true;
      keyPressed=false;
    }
  }
  
  if(keyPressed==true)
  {
    if(key=='v')
    {
      CaveState=true;
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
