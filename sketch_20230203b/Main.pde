
ArrayList<Branch> branches;
ArrayList<Branch> newBranches;
ArrayList<Branch> deadBranches;

void setup()
{
  //size(1080/2,1920/2); 
  fullScreen();
  colorMode(HSB);
  background(0);
  
  branches = new ArrayList<Branch>();
  branches.add(new Branch(width/2, height/2, 0, 0, 255));
  newBranches = new ArrayList<Branch>();
  deadBranches = new ArrayList<Branch>();
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
  
  branches.addAll(newBranches);
  newBranches = new ArrayList<Branch>();
  branches.removeAll(deadBranches);
  deadBranches = new ArrayList<Branch>();
  
  println("branches = " + branches.size());
  println("framerate = " + frameRate);
  println("----");
}
