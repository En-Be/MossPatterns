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

boolean recording;

void setup()
{
  size(1080/2,1920/2); 
  //fullScreen();
  
  colorMode(HSB);
  
  framesPerSecond = 24;
  frameRate(framesPerSecond);
  secondsToRecord = 20;
  
  speed = 100;
  recording = false; // exports png frames to the sketch folder

  //currentProfile = new Profile(false,1,255,0.1f,int(random(0,255)),0,0,0,0,0,0,0,0);

  branches = new ArrayList<Branch>();
  Reset();
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
  println("current hue = " + currentProfile.Hue());
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
  currentProfile = new Profile
  (
    true, //randomAtBranch
    5, //stepSize
    255, //background
    0.001f, //hueChance
    int(random(0,255)), //hue
    0, //hueMin
    0, //hueMax
    0.001f, //saturationChance
    0, //saturation
    0, //saturationMin
    0, //saturationMax
    0.001f, //brightnessChance
    0, //brightness
    0, //brightnessMin
    0 //brightnessMax
  );

  newBranches = new ArrayList<Branch>();
  branches = new ArrayList<Branch>();
  deadBranches = new ArrayList<Branch>();
  noStroke();
  fill(currentProfile.Background());
  rect(0,0,width,height);
  branches.add(new Branch(width/2, height/2, currentProfile.Background())); // final parameter sets color mode (0 = random, 1 = stepped)
}
