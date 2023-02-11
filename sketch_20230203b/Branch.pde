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
  
  int size;
  int sizeVariation;
  
  int colourMode;
  int hue;
  int saturation;
  int brightness;
  int colourVariation;
  
  float[] moveModeLikelihoods;
  
  Branch(float x, float y, int h, int s, int b)
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

    size = 1;
    
    colourMode = 0;
    hue = h;
    saturation = s;
    brightness = b;
    colourVariation = 3;
    
    moveModeLikelihoods = new float[3];
    moveModeLikelihoods[0] = 0; // random
    moveModeLikelihoods[1] = 0.8; // stright lines
    moveModeLikelihoods[2] = 0.9; // curved lines
  }
  
  void Update()
  {
    Move();
    ChooseSize();
    ChooseColour();
    Draw();
    DrawMirrored();
    Grow();
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
    
    println("move mode = " + moveMode);
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
    println("x curve direction = " + xCurveDirection);
    println("y curve direction = " + yCurveDirection);
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
    size += int(random(-2,2));
    size = constrain(size,1,5);
  }
  
  void ChooseColour()
  {
    if(colourMode == 0)
    {
      VaryColour();
    }
  }
  
  void VaryColour()
  {
    hue += int(random(colourVariation*-1,colourVariation));
    //hue = constrain(hue,0,255);
    if(hue < 0)
    {
      hue += 255;
    }
    else if(hue > 255)
    {
      hue -= 255;
    }
    
    saturation += int(random(colourVariation*-1,colourVariation));
    saturation = constrain(saturation,0,255);
    brightness += int(random(colourVariation*-1,colourVariation));
    brightness = constrain(brightness,0,255);
        
    //println("hue = " + hue);
    //println("saturation = " + saturation);
    //println("brightness = " + brightness);
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
      newBranches.add(new Branch(xPos, yPos, hue, saturation, brightness));
      println("branch grown");
    }
    
    if(Likelihood(0.0002) && branches.size() > 1)
    {
      deadBranches.add(this);
      println("branch died");
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
