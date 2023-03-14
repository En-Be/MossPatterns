Profile[]  Presets()
{
  Profile[] profiles = new Profile[3];
  
  profiles[0] = new Profile
  (
    false, //randomAtBranch
    false, //driftAtBranch
    5, //stepSize
    0, //background
    0.0005f, //hueChance 
    int(random(0,255)), //hue
    0, //hueMin
    255, //hueMax
    0.1f, //saturationChance
    255, //saturation
    0, //saturationMin
    255, //saturationMax
    1f, //brightnessChance
    0, //brightness
    0, //brightnessMin
    255 //brightnessMax
  );
  
  profiles[1] = new Profile
  (
    true, //randomAtBranch
    false, //driftAtBranch
    50, //stepSize
    255, //background
    0.0005f, //hueChance 
    int(random(0,255)), //hue
    0, //hueMin
    255, //hueMax
    0.0001f, //saturationChance
    10, //saturation
    10, //saturationMin
    50, //saturationMax
    0.001f, //brightnessChance
    255, //brightness
    220, //brightnessMin
    255 //brightnessMax
  );
  
  profiles[2] = new Profile
  (
    false, //randomAtBranch
    true, //driftAtBranch
    10, //stepSize
    0, //background
    1f, //hueChance 
    int(random(0,255)), //hue
    0, //hueMin
    255, //hueMax
    1f, //saturationChance
    0, //saturation
    0, //saturationMin
    255, //saturationMax
    1f, //brightnessChance
    0, //brightness
    0, //brightnessMin
    255 //brightnessMax
  );

  return profiles;
}
