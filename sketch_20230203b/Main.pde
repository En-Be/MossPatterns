
ArrayList<Branch> branches;
ArrayList<Branch> newBranches;
ArrayList<Branch> deadBranches;

int speed;
int framesPerSecond;
int secondsToRecord;

int tone;

boolean recording;

void setup()
{
  //size(1080/2,1920/2); 
  fullScreen();
  
  colorMode(HSB);
  tone = 0;
  background(tone);
  
  framesPerSecond = 24;
  frameRate(framesPerSecond);
  secondsToRecord = 10;
  
  speed = 100;
  recording = true;

  branches = new ArrayList<Branch>();
  branches.add(new Branch(width/2, height/2, tone, tone, tone, 1));
  newBranches = new ArrayList<Branch>();
  deadBranches = new ArrayList<Branch>();
  
}

void draw()
{
  int s = 0;
  
  while(s < speed)
  {
    for(Branch b : branches)
    {
      b.Update();
    }
    
    branches.addAll(newBranches);
    newBranches = new ArrayList<Branch>();
    branches.removeAll(deadBranches);
    deadBranches = new ArrayList<Branch>();
    
    s++;
  }
  println("branches = " + branches.size());
  println("framerate = " + frameRate);
  println("----");
  
  if(recording)
  {
    saveFrame("MossPattern-####.png");
    if(frameCount >= framesPerSecond*secondsToRecord)
    {
      exit(); 
    }
  }
  

}
