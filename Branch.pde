class Branch
{
  int xOrigin;
  int yOrigin;
  
  int xPos;
  int yPos;
  int size = 1;
  
  int hue;
  int saturation;
  int value;
  
  Branch(int x, int y)
  {
    xOrigin = x;
    yOrigin = y;
    xPos = x;
    yPos = y;
    ChooseColour();
  }
  
  void Update()
  {
    ChoosePosition();
    Draw();
    DrawMirrored();
  }
  
  void ChoosePosition()
  {
    ChooseRandomAdjacent();
  }
  
  void ChooseRandomAdjacent()
  {
    int r = int(random(-2,2));
    xPos += r;
    xPos = constrain(xPos,0,width);
    
    r = int(random(-2,2));
    yPos += r;
    yPos = constrain(yPos,0,height);
  }
  
  void ChooseColour()
  {
    hue = int(random(256));
    saturation = 100;
    value = 255;
  }
  
  void Draw()
  {
    noStroke();
    fill(hue,saturation,value);
    ellipse(xPos,yPos,size,size);
  }
  
  
  void DrawMirrored()
  {
    // Local mirror
    int xFlippedLocal = xOrigin-(xPos-xOrigin);
    int yFlippedLocal = yOrigin-(yPos-yOrigin);
    
    ellipse(xFlippedLocal,yPos,size,size);
    ellipse(xPos,yFlippedLocal,size,size);
    ellipse(xFlippedLocal,yFlippedLocal,size,size);
    
    if(xOrigin != width/2 && yOrigin != height/2)
    {
      //Global mirror
      int xFlippedGlobal1 = width/2-(xPos-width/2);
      int yFlippedGlobal1 = height/2-(yPos-height/2);
      int xFlippedGlobal2 = width/2-(xFlippedLocal-width/2);
      int yFlippedGlobal2 = height/2-(yFlippedLocal-height/2);
     
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

}

//class Branch
//{
  
//  int xStart;
//  int yStart;
//  int xPos;
//  int yPos;
  
//  int walkMode;
//  PVector direction;
  
//  int cR = 0;
//  int cG = 0;
//  int cB = 0;
//  int cVari = 2;
  
//  int drawMode;
//  int ellipseSize = 10;
  
//  int modeChangeChance = 9990;
  
//  Branch(int x, int y)
//  {
//    xStart = x;
//    yStart = y;
//    xPos = x;
//    yPos = y;
//    direction = new PVector(0,0);
//    walkMode=0;
//    drawMode=0;
//  }
  
//  void Update()
//  {
//    Grow();
//    ChooseColour();
//    ChooseDrawMode();
//    ChooseWalkMode();
//    Walk();
//    DrawMirrored(); 
//  }
  
//  void Grow()
//  {
//    int r = int(random(100001));
//    if(r > 99999 && branches.size() < 5)
//    {
//      branches.add(new Branch(xPos,yPos));
//    }
//  }  
  
//  void DrawMirrored()
//  {
//    int xFlipped = xStart*2-xPos;
//    int yFlipped = yStart*2-yPos;
    
//    DrawLocalMirror(xFlipped,yFlipped);
//    DrawGlobalMirror(xFlipped,yFlipped);
//  }
  
//  void DrawMirroredRandomWalk()
//  {
//    RandomWalk();
    
//    int xFlipped = xStart*2-xPos;
//    int yFlipped = yStart*2-yPos;
    
//    DrawLocalMirror(xFlipped,yFlipped);
//    DrawGlobalMirror(xFlipped,yFlipped);
//  }
  
//  void DrawLocalMirror(int x, int y)
//  {  
//    Draw(x,yPos);
//    DrawGlobalMirror(x, yPos);
    
//    Draw(xPos,y);
//    DrawGlobalMirror(xPos, y);
    
//    Draw(x,y);
//    DrawGlobalMirror(x, y);
    
//    Draw(xPos,yPos);
//    DrawGlobalMirror(xPos,yPos);
//  }
  
//  void DrawGlobalMirror(int x, int y)
//  {
//    Draw(width-x,yPos);
//    Draw(xPos,height-y);
//    Draw(width-x,height-y);
    
//    Draw(width-xPos,y);
//    Draw(xPos,height-yPos);
//    Draw(width-xPos,height-yPos);
    
//    Draw(width-xPos,yPos);
//    Draw(x, height-yPos);
//    Draw(x, height-y);
    
//    Draw(width-x, y);
//  }
  
//  void DrawRandomWalk()
//  {
//    RandomWalk();
//    Draw(xPos,yPos);
//  }
  
//  void RandomWalk()
//  {
//    xPos += ChooseRandomAdjacent();
//    xPos = constrain(xPos,0,width);
//    yPos += ChooseRandomAdjacent();
//    yPos = constrain(yPos,0,height);
//  }
  
//  void StraightWalk()
//  {
//    xPos += direction.x;
//    xPos = constrain(xPos,0,width);
//    yPos += direction.y;
//    yPos = constrain(yPos,0,height);
//  }
  
//  void NewStraightWalk()
//  {
//    int x = ChooseRandomAdjacent(3);
//    int y = ChooseRandomAdjacent(3);
//    direction = new PVector(x,y);
//  }
  
//  void Walk()
//  {
//    if(walkMode == 1)
//      {
//        StraightWalk();
//      }
//      else
//      {
//        RandomWalk();
//      }
//  }
  
//  void ChooseWalkMode()
//  {
//    int r = int(random(10001));
//    if(r>modeChangeChance)
//    {
//      int m = int(random(2));
//      walkMode = m;
      
//      if(walkMode == 1)
//      {
//        NewStraightWalk();
//        modeChangeChance = 9900;
//      }
//      else
//      {
//        modeChangeChance = 9990;
//      }
//    }
 
//  }
  
//  void ChooseDrawMode()
//  {
//    int r = int(random(10001));
//    if(r > 9995)
//    {
//      drawMode = 1;
//      ellipseSize = int(random(16,32));
//    }
//    else
//    {
//      drawMode = 0;
//    }
//  }
  
//  void Draw(int x, int y)
//  {
//    noStroke();
//    rectMode(CORNER);
//    fill(cR,cB,cG);
//    if(drawMode == 1)
//    {
//      ellipseMode(CENTER);
//      ellipse(x,y,ellipseSize,ellipseSize);
//    }
//    else
//    {
//      //rect(x,y,res,res);
//    }
//  }
  
//  void ChooseColour()
//  {
//    cR += int(random(cVari*-1,cVari));
//    cR = constrain(cR,0,255);
//    cG += int(random(cVari*-1,cVari));
//    cG = constrain(cG,0,255);
//    cB += int(random(cVari*-1,cVari));
//    cB = constrain(cB,0,255);
//  }
  
//  int ChooseRandomAdjacent()
//  {
//    int rand = int(random(-1,1));
//    return rand;
//  }
//}
