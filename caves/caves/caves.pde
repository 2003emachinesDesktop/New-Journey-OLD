
int posX=20;
int posY=20;

int size=100;

int x=75;
int y=75;

int oldx=x;
int oldy=y;

boolean collision=false;

String[] saveFile;

boolean run=true;

Genorator NewCave;


void setup()
{
  size(700,700);
  frameRate(30);
  
  saveFile=loadStrings("/home/pi/Desktop/saveFile.txt");
  
  collision=false;
  
  NewCave=new Genorator();
  
  fill(75);
  strokeWeight(0);
  noStroke();
}


void draw()
{
  if(keyPressed==true)
  {
    if(collision==false)
    {
      if(key=='a')
      {
        x--;
      }
      if(key=='d')
      {
        x++;
      }
      if(key=='w')
      {
        y--;
      }
      if(key=='s')
      {
        y++;
      }
      
      oldx=x;
      oldy=y;
    }
  }
  
  
  if(run==true)
  {
    background(127);
    
    for(String i: saveFile)
    {
      fill(75);
      
      if(i.equals("0"))
      {
        rect(posX,posY,size,size);
        
        
        posX+=size;
        posY+=size/2-size/10;
      }
      
      if(i.equals("1"))
      {
        rect(posX,posY,size,size/5);
      
      
        posX+=size;
      }  
      
      if(i.equals("2"))
      {
        rect(posX,posY,size/5,size);
        
        
        posY+=size;
      }
      if(i.equals("3"))
      {
        rect(posX,posY-size/2,size,size/5);
       
        
        posX+=size;
        posY-=size/2;
      }
      
      if(i.equals("4"))
      {
        rect(posX-size,posY,size,size/5);
        
        
        posX-=size;
        posY-=size/2;
      }
      
      if(i.equals("5"))
      {
        rect(posX-size/2,posY+size/5,size/5,size);
        
        
        posX-=size/2;
        posY+=size;
      }
      
      if(i.equals("6"))
      {
        rect(posX-size/2,posY-size,size/5,size);
       
        
        posX-=size/2;
        posY-=size;
      }
    }
    
    posX=20;
    posY=20;
  }
  
  
  
    if(mousePressed==true)
    {
      NewCave.CreateCave();
    }
  
    fill(0);
    rect(x,y,size/10,size/10);
}
