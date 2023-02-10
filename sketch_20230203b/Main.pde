
ArrayList<Branch> branches;

void setup()
{
  size(1080/2,1920/2); 
  //fullScreen();
  colorMode(HSB);
  background(0);
  
  branches = new ArrayList<Branch>();
  branches.add(new Branch(width/2,height/2,255));
  //branches.add(new Branch(width/4,height/4));
  //branches.add(new Branch(int(width*0.6),int(height*0.6)));

}

void draw()
{
  //int i = 0;
  //float x1 = 100;
  //float x2 = 100;
  //float y1 = 100;
  //float y2 = 100;
  
  //while(i <= 500)
  //{
  //  circle(x1,y1,1);
  //  circle(x2,y2,1);
  //  x1 += 1;
  //  x2 += 0.95;
  //  y1 += 1;
  //  y2 += 1;
  //  i++;
  //}
  


  for(Branch b : branches)
  {
    b.Update();
  }
  
  //println("branches = " + branches.size());
  println("framerate = " + frameRate);
  println("----");
}
