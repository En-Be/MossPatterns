
ArrayList<Branch> branches;
ArrayList<Branch> newBranches;
ArrayList<Branch> deadBranches;

void setup()
{
  size(1080/2,1920/2); 
  //fullScreen();
  colorMode(HSB);
  background(0);
  
  branches = new ArrayList<Branch>();
  branches.add(new Branch(width/2, height/2, 0, 0, 255));
  newBranches = new ArrayList<Branch>();
  deadBranches = new ArrayList<Branch>();
}

void draw()
{
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
