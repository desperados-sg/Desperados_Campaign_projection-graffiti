private class BrushFactory {
  private PImage solidImg = loadImage("solid.png");
  private PImage featheredImg = loadImage("feathered.png");
  private PImage grittyImg = loadImage("gritty.png");
  
  
  void solidBrush(int brushRadius, color col)
  {
    originalLayer.strokeWeight(brushRadius*2);
    originalLayer.stroke(col);
    if (pmouseX == 0 || pmouseY == 0)
    {
      originalLayer.line(mouseX, mouseY, mouseX, mouseY);  //must draw on the originalLayer layer only
    }
    else
    {
      originalLayer.line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }
  
  void featheredBrush(int brushRadius, color col)
  {
    int thickness = brushRadius * 2;
    for(int i = 0; i < thickness; i+=5)
    {
      originalLayer.strokeWeight(i);
      originalLayer.stroke(col, 5);
      if (pmouseX == 0 || pmouseY == 0)
      {
        originalLayer.line(mouseX, mouseY, mouseX, mouseY);
      }
      else
      {
        originalLayer.line(mouseX, mouseY, pmouseX, pmouseY);
      }
    }
  }
  
  void grittyBrush(int brushRadius, color col) {
    int maxIterations = 150; // how fast spraying happens
   
    float radx;   // Radius
    float rady;
    float angle; // angle
    float x;      // result
    float y;
    
    originalLayer.stroke(col);
    
    for (int i=0; i < maxIterations; i++)
    {
      radx=min(random(brushRadius), random(brushRadius));
      rady=min(random(brushRadius),random(brushRadius));
      radx=min(radx, random(brushRadius));
      rady=min(rady, random(brushRadius));
      angle= random(360);
      //
      x=(radx*cos(radians(angle)))+mouseX;
      y=(radx*sin(radians(angle)))+mouseY;
      //
      originalLayer.stroke(col);
      originalLayer.point(x, y);
    }
  }
  
  void rollerEraser(int width, color col)
  {
    originalLayer.fill(col);
    originalLayer.noStroke();
    originalLayer.rect(mouseX-width/2, mouseY-10, width, 20);
  }
    
  void drawSolidBrushPrint(int brushRadius, float posX, float posY)
  {
    image(solidImg, posX, posY, brushRadius, brushRadius);
  }
  
  void drawFeatheredBrushPrint(int brushRadius, float posX, float posY)
  {
    image(featheredImg, posX, posY, brushRadius, brushRadius);
  }
  
  void drawGrittyBrushPrint(int brushRadius, float posX, float posY)
  {
    image(grittyImg, posX, posY, brushRadius, brushRadius);
  }
}