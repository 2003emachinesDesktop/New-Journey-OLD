
String input;
String output[];

void setup()
{
  selectInput("Select a file to process:", "fileSelected");
  //output=loadStrings(input);
  //noLoop();
}

void draw() 
{
  if(mousePressed==true)
  {
    for(int i=0; i<output.length; i++)
    {
      println(output[i]);
    }
    mousePressed=false;
  }
}


void fileSelected(File selection) {

    if(selection == null) 
    {
        println("Window was closed or the user hit 'cancel.'");
    } 
    else {
        input=selection.getAbsolutePath();  
        output=loadStrings(input);
    }
}



/*
String[] input;
String output;

void setup() {
    selectInput("Select a file to process:", "fileSelected");
}

void draw() {
    if(output!=null)
    {
      noLoop();
      println(output);
    }
}

void fileSelected(File selection) {

    if(selection == null) 
    {
        println("Window was closed or the user hit 'cancel.'");
    } 
    else {
        String filepath=selection.getAbsolutePath();
        input=loadStrings(filepath);

        for(int i=0;i<input.length;i++)
        output+=input[i]+"\n";       
    }
}
*/
