
class Genorator
{
  
  PrintWriter saveFile;
  
  int limit=10;
  int amount=7;
  
  void CreateCave()
  {
    saveFile=createWriter("/home/pi/Desktop/saveFile.txt");
    
    saveFile.println(0);
    saveFile.println(1);
    saveFile.println(1);
    
    for(int i=0;i<=limit;i++)
    {
      int x=0;
      x=int(random(1,amount));
      
      if(x==1)
      {
        saveFile.println(1);
      }
      
      if(x==2)
      {
        saveFile.println(2);
      }
      
      if(x==3)
      {
        saveFile.println(3);
        saveFile.println(2);
      }
      
      if(x==4)
      {
        saveFile.println(4);
        saveFile.println(2);
      }
      
      if(x==5)
      {
        saveFile.println(5);
        saveFile.println(1);
      }
      
      if(x==6)
      {
        saveFile.println(6);
        saveFile.println(1);
      }
      
    }
    
    saveFile.flush();
    saveFile.close();
    exit();
  }
}
