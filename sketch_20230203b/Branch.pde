class Branch
{
  float xOrigin;
  float yOrigin;
  
  int moveMode;
  float xPos;
  float yPos;
  float xDirection;
  float yDirection;
  float xCurveDirection;
  float yCurveDirection;
  
  float size;
  int sizeMode;
  float sizeVariation;
  float sizeMax;
  
  int hue;
  int saturation;
  int brightness;
  
  float[] moveModeLikelihoods;
  
  Branch(float x, float y, int t)
  {
    xOrigin = x;
    yOrigin = y;
    
    moveMode = 0;
    xPos = x;
    yPos = y;
    xDirection = 0;
    yDirection = 0;
    xCurveDirection = 0;
    yCurveDirection = 0;
    moveModeLikelihoods = new float[3];
    moveModeLikelihoods[0] = 0; // random
    moveModeLikelihoods[1] = 0.8; // stright lines
    moveModeLikelihoods[2] = 0.9; // curved lines
    
    size = 1;
    sizeMode = 0;
    sizeVariation = 1;
    sizeMax = 1;
    
    //colourMode = cm;
    //hue = t;
    saturation = currentProfile.Saturation();
    brightness = currentProfile.Brightness();
    //colourVariation = 10;
    
    if(currentProfile.RandomAtBranch())
    {
      hue = int(random(255));
    }
    else
    {
      hue = currentProfile.Hue();
      //hue += int(random(-2,2))*colourVariation;
      //HueCycle();
    }
    
    //if(colourMode == 1)
    //{
    //  hue += int(random(-2,2))*colourVariation;
    //  HueCycle();
    //}
    //else
    //{
    //  hue = int(random(255));
    //}
  }
  
  void Update()
  {
    Move();
    ChooseSize();
    ChangeColour();
    Draw();
    DrawMirrored();
    Grow();
    //text(20,20,hue);
    //println("current hue = " + hue);
  }
  
  void Move()
  {
    if(moveMode == 0) // Random walk
    {
      if(Likelihood(0.001))  // likelihood to change
      {
        ChooseMoveMode();
      }
      else
      {
        MoveRandomAdjacent();
      }
    }
    else if(moveMode == 1) // Straight lines
    {
      if(Likelihood(0.01))  // likelihood to change
      {
        ChooseMoveMode();
      }
      else
      {
        MoveAlongLine();
      }
    }
    else if(moveMode == 2) // Curved lines
    {
      if(Likelihood(0.01))  // likelihood to change
      {
        ChooseMoveMode();
      }
      else
      {
        MoveAlongCurve();
      }
    }
    
    //println("move mode = " + moveMode);
  }
  
  void ChooseMoveMode()
  {
    float r = random(1);
    
    if(r > moveModeLikelihoods[2])
    {
      moveMode = 2;
      NewCurveDirection();
    }
    else if(r > moveModeLikelihoods[1])
    {
      moveMode = 1;
      NewLineDirection();
    }
    else
    {
      moveMode = 0;
    }
  }
  
  void MoveRandomAdjacent()
  {
    int r = int(random(-2,2));
    xPos += r;
    xPos = constrain(xPos,0,width);
    
    r = int(random(-2,2));
    yPos += r;
    yPos = constrain(yPos,0,height);
  }
  
  void NewLineDirection()
  {
    float r = random(-2,2);
    xDirection = r;
    
    r = random(-2,2);
    yDirection = r;
  }
  
  void MoveAlongLine()
  {
    xPos += xDirection;
    xPos = constrain(xPos,0,width);
    yPos += yDirection;
    yPos = constrain(yPos,0,height);
  }
  
  void NewCurveDirection()
  {
    xDirection = 0;
    yDirection = 0;
    xCurveDirection = random(-0.2,0.2);
    yCurveDirection = random(-0.2,0.2);
    //println("x curve direction = " + xCurveDirection);
    //println("y curve direction = " + yCurveDirection);
  }
  
  void MoveAlongCurve()
  {
    //float r = random(-0.4,0.4);
    xDirection += xCurveDirection;
    xDirection = constrain(xDirection,-1,1);
    //r = random(-0.4,0.4);
    yDirection += yCurveDirection;
    yDirection = constrain(yDirection,-1,1);
    xPos += xDirection;
    xPos = constrain(xPos,0,width);
    yPos += yDirection;
    yPos = constrain(yPos,0,height);
  }
  
  void ChooseSize()
  {
    //println("size mode  = " + sizeMode);
    //println("size = " + size);
    //println("size max = " + sizeMax);
    if(sizeMode == 1)
    {
      size += sizeVariation;
      
      if(size > sizeMax)
      {
        sizeVariation = -0.2;
      }
      else if(size < 1)
      {
        sizeMode = 0;
        sizeMax = 4;
      }    
    }
    else if(sizeMode == 0)
    {
      size += int(random(-2,2));
      size = constrain(size,1,sizeMax);
      if(Likelihood(0.00002))
      {
        sizeVariation = 0.2;
        sizeMax = random(100);
        sizeMode = 1;
      }
    }
  }
  
  void ChangeColour()
  {
    if(Likelihood(currentProfile.HueChance()))
    {
      hue += int(random(-2,2))*currentProfile.StepSize();
      HueCycle();
    }
    
    if(Likelihood(currentProfile.SaturationChance()))
    {
      saturation += int(random(-2,2))*currentProfile.StepSize();
      saturation = constrain(saturation,currentProfile.SaturationMin(),currentProfile.SaturationMax());
    }
    
    if(Likelihood(currentProfile.BrightnessChance()))
    {
      brightness += int(random(-2,2))*currentProfile.StepSize();
      brightness = constrain(brightness,currentProfile.BrightnessMin(),currentProfile.BrightnessMax());
    } 
  }
  
  void HueCycle()
  {
    if(hue < 0)
    {
      hue += 255;
    }
    else if(hue > 255)
    {
      hue -= 255;
    }
  }
  
  void Draw()
  {
    noStroke();
    fill(hue,saturation,brightness);
    ellipse(xPos,yPos,size,size);
  }
  
  void DrawMirrored()
  {
    // Local mirror
    float xFlippedLocal = xOrigin-(xPos-xOrigin);
    float yFlippedLocal = yOrigin-(yPos-yOrigin);
    
    ellipse(xFlippedLocal,yPos,size,size);
    ellipse(xPos,yFlippedLocal,size,size);
    ellipse(xFlippedLocal,yFlippedLocal,size,size);
    
    if(xOrigin != width/2 && yOrigin != height/2)
    {
      //Global mirror
      float xFlippedGlobal1 = width/2-(xPos-width/2);
      float yFlippedGlobal1 = height/2-(yPos-height/2);
      float xFlippedGlobal2 = width/2-(xFlippedLocal-width/2);
      float yFlippedGlobal2 = height/2-(yFlippedLocal-height/2);
     
      //global opposite x
      ellipse(xFlippedGlobal1,yPos,size,size);
      ellipse(xFlippedGlobal1,yFlippedLocal,size,size);
      ellipse(xFlippedGlobal2,yPos,size,size);
      ellipse(xFlippedGlobal2,yFlippedLocal,size,size);
      
      //global opposite y
      ellipse(xPos,yFlippedGlobal1,size,size);
      ellipse(xFlippedLocal,yFlippedGlobal1,size,size);
      ellipse(xPos,yFlippedGlobal2,size,size);
      ellipse(xFlippedLocal,yFlippedGlobal2,size,size);
  
      //global opposite x + y
      ellipse(xFlippedGlobal1,yFlippedGlobal1,size,size);
      ellipse(xFlippedGlobal2,yFlippedGlobal2,size,size);
      ellipse(xFlippedGlobal1,yFlippedGlobal2,size,size);
      ellipse(xFlippedGlobal2,yFlippedGlobal1,size,size);
    }
  }
  
  void Grow()
  {
    
    if(Likelihood(0.0002) && branches.size() < 10)
    {
      if(currentProfile.RandomAtBranch())
      {
        currentProfile.Hue(int(random(0,255)));
      }
      else if(currentProfile.DriftAtBranch())
      {
        currentProfile.Hue(hue);
        currentProfile.Saturation(saturation);
        currentProfile.Brightness(brightness);
      }
          
      newBranches.add(new Branch(xPos, yPos, currentProfile.Hue()));
      //println("branch grown");
    }
    
    if(Likelihood(0.0002) && branches.size() > 1)
    {
      deadBranches.add(this);
      //println("branch died");
    }
  }
  
  boolean Likelihood(float f)
  {
    float r = random(1);
    if(r >= 1 - f)
    {
      return true;
    }
    else
    {
      return false;
    }
  }

}
