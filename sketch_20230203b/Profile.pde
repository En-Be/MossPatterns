class Profile
{
  boolean randomAtBranch;
  boolean driftAtBranch;
  int stepSize;
  
  int background;
  
  float hueChance;
  int hue;
  int hueMin;
  int hueMax;
  
  float saturationChance;
  int saturation;
  int saturationMin;
  int saturationMax;
  
  float brightnessChance;
  int brightness;
  int brightnessMin;
  int brightnessMax;
  
  Profile(boolean rAB, boolean dAB, int sS, int bG, float cC, int h, int hMin, int hMax, float satC, int sat, int sMin, int sMax, float briC, int bri, int briMin, int briMax)
  {
    randomAtBranch = rAB;
    driftAtBranch = dAB;
    stepSize = sS;
    background = bG;
    
    hueChance = cC;
    hue = h;
    hueMin = hMin;
    hueMax = hMax;
    
    saturationChance = satC;
    saturation = sat;
    saturationMin = sMin;
    saturationMax = sMax;
    
    brightnessChance = briC;
    brightness = bri;
    brightnessMin = briMin;
    brightnessMax = briMax;
  }
  
  boolean RandomAtBranch()
  {
    return randomAtBranch;  
  }
  
  boolean DriftAtBranch()
  {
    return driftAtBranch;
  }
  
  int StepSize()
  {
    return stepSize;
  }
  
  int Background()
  {
    return background;
  }
  
  float HueChance()
  {
    return hueChance;
  }
  
  void Hue(int h)
  {
    hue = h;
  }
  
  int Hue()
  {
    return hue; 
  }
  
  float SaturationChance()
  {
    return saturationChance; 
  }
  
  int Saturation()
  {
    return saturation;
  }
  
  void Saturation(int s)
  {
    saturation = s;
  }
  
  int SaturationMin()
  {
    return saturationMin;  
  }
  
  int SaturationMax()
  {
    return saturationMax;  
  }
  
  float BrightnessChance()
  {
    return brightnessChance; 
  }
  
  int Brightness()
  {
    return brightness;
  }
  
  void Brightness(int b)
  {
    brightness = b;
  }
  
  int BrightnessMin()
  {
    return brightnessMin;  
  }
  
  int BrightnessMax()
  {
    return brightnessMax;  
  }
  
}

/*
COLOUR MODES
0 = random everything
1 = stepped with random everything at branch
2 = dark background, stepped with random hue at branch, high saturation
3 = light background, stepped with random hue at branch, low saturation
4 = random hue at start, stepped value at branch
*/
