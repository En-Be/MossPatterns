class Profile
{
  boolean randomAtBranch;
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
  
  Profile(boolean rAB, int sS, int bG, float cC, int h, int hMin, int hMax, float satC, int sat, int sMin, int sMax, float briC, int bri, int briMin, int briMax)
  {
    randomAtBranch = rAB;
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
  
  float BrightnessChance()
  {
    return brightnessChance; 
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
