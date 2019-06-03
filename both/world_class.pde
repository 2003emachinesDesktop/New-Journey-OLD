class GameWorld
{
  int worldSize=300;
  int[][] worldCoord;
  
  String columns[];
  String rows[];
  
  PImage tile1;
  PImage tile2;
  PImage tile3;
  PImage tile4;
  PImage tile5;
  PImage tree1;
  PImage tree2;

  boolean d;
  boolean p;

  int x;
  int y;
  
  GameWorld()
  {
  }
  
  void Load()
  {
    tile1=loadImage("tile1.png");
    tile2=loadImage("tile2.png");
    tile3=loadImage("tile3.png");
    tile4=loadImage("tile4.png");
    tile5=loadImage("tile5.png");
    tree1=loadImage("tree.png");
    tree2=loadImage("tree2.png");
    
    //rows=loadStrings("game_data.txt");
    rows = loadStrings(input);

    columns=splitTokens(rows[1]);

    worldCoord=new int[rows.length][columns.length];

    //println("There are "+ rows.length +" rows");
    //println("There are "+columns.length +" columns");

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
      if(x/30==1)
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
          image(tile1,i*100,k*100);
        }
        if(worldCoord[i][k]==6)
        {
          image(tile2,i*100,k*100);
        }
        if(worldCoord[i][k]==7)
        {
          image(tile3,i*100,k*100);
        }
        if(worldCoord[i][k]==8)
        {
          image(tile4,i*100,k*100);
        }
        if(worldCoord[i][k]==9)
        {
          image(tile5,i*100,k*100);
        }    
      }
    }
      
    for(int i=0; i<rows.length; i++)
    {
      for(int k=0; k<columns.length; k++)
      {
        if(worldCoord[i][k]==10)
        {
          image(tree1,i*100,k*100);
        }
        if(worldCoord[i][k]==11)
        {
          image(tree2,i*100,k*100);
        }
      }
    }
  }
}
