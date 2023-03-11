int d;
int h;
int m;
int s;

ArrayList<Branch> branches;
ArrayList<Branch> newBranches;
ArrayList<Branch> deadBranches;

Profile currentProfile;

int speed;
int framesPerSecond;
int secondsToRecord;

int tone;

boolean recording;

void setup()
{
  size(1080/2,1920/2); 
  //fullScreen();
  
  colorMode(HSB);
  tone = 0; // start black(0) or white(255)
  background(tone);
  
  framesPerSecond = 24;
  frameRate(framesPerSecond);
  secondsToRecord = 20;
  
  speed = 100;
  recording = false; // exports png frames to the sketch folder

  currentProfile = new Profile(false, false, 0,0,int(random(305,305)),0,0,0,0,0,0,0,0);

  branches = new ArrayList<Branch>();
  branches.add(new Branch(width/2, height/2, tone, 1)); // final parameter sets color mode (0 = random, 1 = stepped)
  newBranches = new ArrayList<Branch>();
  deadBranches = new ArrayList<Branch>();

  SetTiming();
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
      //exit(); 
    }
  }
  else
  {
    UpdateTiming();
  }
}

void SetTiming()
{
  d = day();
  h = hour();
  m = minute();
  s = second();
}

void UpdateTiming()
{
  if(m != minute())
  {
    saveFrame("MossPattern-####.png");
    Reset();
    SetTiming();
  }
}

void Reset()
{
  newBranches = new ArrayList<Branch>();
  branches = new ArrayList<Branch>();
  deadBranches = new ArrayList<Branch>();
  noStroke();
  fill(tone);
  rect(0,0,width,height);
  branches.add(new Branch(width/2, height/2, tone, 1)); // final parameter sets color mode (0 = random, 1 = stepped)
}
