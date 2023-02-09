
ArrayList<Branch> branches;

void setup()
{
  size(1080/2,1920/2); 
  //fullScreen();
  colorMode(HSB);
  background(255);
  
  branches = new ArrayList<Branch>();
  branches.add(new Branch(width/2,height/2));
  branches.add(new Branch(width/4,height/4));
  branches.add(new Branch(int(width*0.6),int(height*0.6)));

}

void draw()
{

  for(Branch b : branches)
  {
    b.Update();
  }
  
  //println("branches = " + branches.size());
  println("framrate = " + frameRate);
  
}
