int d;
int h;
int m;
int s;

ArrayList<Branch> branches;
ArrayList<Branch> newBranches;
ArrayList<Branch> deadBranches;

Profile[] presets;
int presetToLoad;
Profile currentProfile;

int speed;
int framesPerSecond;
int secondsToRecord;

boolean recording;

void setup()
{
  size(1080/2,1920/2);
  //size(1920, 100);
  //fullScreen();
  
  colorMode(HSB);
  presetToLoad = 2;
  
  framesPerSecond = 24;
  frameRate(framesPerSecond);
  secondsToRecord = 10;
  
  speed = 20;
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
  println("second = " + second());
  println("----");
  
  if(recording)
  {
    saveFrame("MossPattern-####.png");
    if(frameCount >= framesPerSecond*secondsToRecord)
    {
      exit(); 
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
  presets = Presets();
  currentProfile = presets[presetToLoad];

  newBranches = new ArrayList<Branch>();
  branches = new ArrayList<Branch>();
  deadBranches = new ArrayList<Branch>();
  
  noStroke();
  fill(currentProfile.Background());
  rect(0,0,width,height);
  
  branches.add(new Branch(width/2, height/2, currentProfile.Background())); // final parameter sets color mode (0 = random, 1 = stepped)
}
