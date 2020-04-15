

class NumberRect
{
  PVector topLeft;
  PVector topRight;
  PVector botLeft;
  PVector botRight;

  NumberRect(PVector tl, PVector tr, PVector bl, PVector br)
  {
    topLeft = tl;
    topRight = tr;
    botLeft = bl;
    botRight = br;
  }

  synchronized void display(int number)
  {
    pushStyle();
    // Outside Rectandle
    strokeWeight(1);
    stroke(86);
    noFill();

    line(topLeft.x, topLeft.y, topRight.x, topRight.y);
    line(botLeft.x, botLeft.y, botRight.x, botRight.y);
    line(topLeft.x, topLeft.y, botLeft.x, botRight.y);
    line(topRight.x, topRight.y, botRight.x, botRight.y);
    popStyle();

    int scaleFactor = 6;
    
    pushStyle();
    // Establish the offset from the bottom left
    PVector leftCorner = new PVector();
    leftCorner.x = botLeft.x;
    leftCorner.y = botLeft.y - (number*scaleFactor);
    
    PVector rightCorner = new PVector();
    rightCorner.x = botRight.x;
    rightCorner.y = botRight.y - (number*scaleFactor);
    
    noStroke();
    
    fill((topLeft.y/53)*255, 158, 21);
    
    rect(leftCorner.x, leftCorner.y, 100, 4);
    popStyle();
  }
}
