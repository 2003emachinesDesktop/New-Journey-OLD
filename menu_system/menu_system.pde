PImage start;
PImage menu;
PImage play;
PImage options;
PImage loading;

int gameScreen=0;

void setup()
{
  size(1800,900);
  frameRate(30);
  //fullScreen();
  background(0);
  
  start=loadImage("startscreen.png");
  menu=loadImage("menuscreen.png");
  play=loadImage("playscreen.png");
  loading=loadImage("loadingscreen.png");
  options=loadImage("optionsscreen.png");
}

void draw()
{
  if(gameScreen==0)
  {
    startScreen();
  }
  else if(gameScreen==1)
  {
    menuScreen();
  }
  else if(gameScreen==2)
  {
    loadingScreen();
  }
  else if(gameScreen==3)
  {
    optionsScreen();
  }
  else if(gameScreen==4)
  {
    inventoryScreen();
  }
}

void startScreen()
{
  image(start,0,0);
  
  if(mousePressed == true || keyPressed==true)
  {
    gameScreen=1;
    mousePressed=false;
    keyPressed=false;
  }
}

void menuScreen()
{
  image(menu,0,0);
  
  if(mousePressed==true)
  {
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>258 && mouseY<378)
      {
        gameScreen=2;
        mousePressed=false;
      }
    }
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>414 && mouseY<537)
      {
        gameScreen=2;
        mousePressed=false;
      }
    }
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>568 && mouseY<691)
      {
        gameScreen=3;
        mousePressed=false;
      }
    }
    if(mouseX>706 && mouseX<1166)
    {
      if(mouseY>722 && mouseY<844)
      {
        exit();
        mousePressed=false;
      }
    }
  }
}

void loadingScreen()
{
  image(loading,0,0);
}

void optionsScreen()
{
  image(options,0,0);
}

void inventoryScreen()
{
}


  
