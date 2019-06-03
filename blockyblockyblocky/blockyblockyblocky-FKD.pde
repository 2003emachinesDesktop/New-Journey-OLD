PImage tile1;
PImage tile2;
PImage tile3;
PImage tile4;
PImage tile5;
PImage tile6;
PImage tile7;
PImage tile8;

//String[] input;
//String output;

Boolean hasLoaded=false;

String filePath;

String rows[];
String columns[];
int array2D[][];


void setup()
{
  size(600,600);
  background(0);
  frameRate(30);
  
  tile1=loadImage("grass0.png");
  tile2=loadImage("grass1.png");
  tile3=loadImage("grass2.png");
  tile4=loadImage("tile1.png");
  tile5=loadImage("tile2.png");
  tile6=loadImage("tree.png");
  tile7=loadImage("tree2.png");
  tile8=loadImage("tile2.png");
  
  selectInput("Select Your Save File:", "fileSelected");
  println("%%%%%%%%");
}

void draw()
{
  if(hasLoaded==true)
  {
    load();
    //println(rows);
    hasLoaded=false;
  }
  
  if(hasLoaded==false)
  {
    println(rows);
    
    /*
    for(int i=0; i<rows.length; i++)
    {
      println(rows[i]);
    }
    */
  }
  
  /*if(hasLoaded==false)
  {
    for(int a=0; a<rows.length; a++)
    {
    for(int b=0; b<columns.length; b++)
    {
     if(array2D[a][b]==1)
     {
       image(tile1,a*100,b*100);
     }
     if(array2D[a][b]==2)
     {
       image(tile2,a*100,b*100);
     }
     if(array2D[a][b]==3)
     {
       image(tile3,a*100,b*100);
     }
     if(array2D[a][b]==4)
     {
       image(tile4,a*100,b*100);
     }
     if(array2D[a][b]==5)
     {
       image(tile5,a*100,b*100);
     }
     if(array2D[a][b]==6)
     {
       image(tile6,a*100,b*100);
     }
     if(array2D[a][b]==7)
     {
       image(tile7,a*100,b*100);
     }
     if(array2D[a][b]==8)
     {
       image(tile8,a*100,b*100);
     }
    }
  }
  }*/
}

void fileSelected(File selection) 
{
  if(selection == null) 
  {
     println("Window was closed or the user hit 'cancel.'");
  } 
  else 
  {
    filePath=selection.getAbsolutePath(); 
    rows=loadStrings(filePath);
    hasLoaded=true;
  }
}

void load()
{
  //rows=loadStrings(filePath);
  
   if(hasLoaded==true)
   {
     println(rows);
    
     columns=splitTokens(rows[1]);

     array2D=new int[rows.length][columns.length];

     println("There are "+ rows.length +" rows");
     println("There are "+columns.length +" columns");
     
     for(int a=0; a<rows.length; a++)
     {
       columns=splitTokens(rows[a]);
    
       for(int b=0; b<columns.length; b++)
       {
         array2D[a][b]=Integer.parseInt(columns[b]);
       }
     }
   }
}
