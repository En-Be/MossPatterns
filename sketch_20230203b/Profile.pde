class Profile
{
  boolean randomAtBranch;
  boolean stepped;
  int stepSize;
  
  int background;
  
  int hue;
  int hueMin;
  int hueMax;
  
  int saturation;
  int saturationMin;
  int saturationMax;
  
  int brightness;
  int brightnessMin;
  int brightnessMax;
  
  Profile(boolean rAB, boolean s, int sS, int bG, int h, int hMin, int hMax, int sat, int sMin, int sMax, int bri, int briMin, int briMax)
  {
    randomAtBranch = rAB;
    stepped = s;
    stepSize = sS;
    background = bG;
    hue = h;
    hueMin = hMin;
    hueMax = hMax;
    saturation = sat;
    saturationMin = sMin;
    saturationMax = sMax;
    brightness = bri;
    brightnessMin = briMin;
    brightnessMax = briMax;
  }
  
  boolean RandomAtBranch()
  {
    return randomAtBranch;  
  }
  
  void Hue(int h)
  {
    hue = h;
  }
  
  int Hue()
  {
    return hue; 
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
