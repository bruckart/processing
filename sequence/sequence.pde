

String numbersFile = "l6.kwl";
Reader r;

NumberRect nr1;
NumberRect nr2;
NumberRect nr3;
NumberRect nr4;
NumberRect nr5;
NumberRect nr6;

boolean loop = true;

PGraphics theBackground;
PGraphics theTextBackground;

void setup()
{
  background(55);
  size(800, 400, P3D);

  r = new Reader(numbersFile);


  smooth();
  int columnWidth = 100;
  
  PVector padding = new PVector(20, 0);
  PVector shift = new PVector(100, 0);

  PVector topLeft = new PVector(50, 50);
  PVector topRight = new PVector(topLeft.x+columnWidth, 50);
  PVector bottomLeft = new PVector(50, 350);
  PVector bottomRight = new PVector(bottomLeft.x+columnWidth, 350);

  nr1 = new NumberRect(topLeft, topRight, bottomLeft, bottomRight);

  {
    PVector topLeft1 = new PVector(topLeft.x, topLeft.y);
    PVector topRight1 = new PVector(topRight.x, topRight.y);
    PVector bottomLeft1 = new PVector(bottomLeft.x, bottomLeft.y);
    PVector bottomRight1 = new PVector(bottomRight.x, bottomRight.y);
    topLeft1.add(padding);
    topLeft1.add(shift);
    topRight1.add(padding);
    topRight1.add(shift);
    bottomLeft1.add(padding);
    bottomLeft1.add(shift);
    bottomRight1.add(padding);
    bottomRight1.add(shift);
    nr2 = new NumberRect(topLeft1, topRight1, bottomLeft1, bottomRight1);

    PVector topLeft2 = new PVector(topLeft1.x, topLeft1.y);
    PVector topRight2 = new PVector(topRight1.x, topRight1.y);
    PVector bottomLeft2 = new PVector(bottomLeft1.x, bottomLeft1.y);
    PVector bottomRight2 = new PVector(bottomRight1.x, bottomRight1.y);
    topLeft2.add(padding);
    topLeft2.add(shift);
    topRight2.add(padding);
    topRight2.add(shift);
    bottomLeft2.add(padding);
    bottomLeft2.add(shift);
    bottomRight2.add(padding);
    bottomRight2.add(shift);
    nr3 = new NumberRect(topLeft2, topRight2, bottomLeft2, bottomRight2);

    PVector topLeft3 = new PVector(topLeft2.x, topLeft2.y);
    PVector topRight3 = new PVector(topRight2.x, topRight2.y);
    PVector bottomLeft3 = new PVector(bottomLeft2.x, bottomLeft2.y);
    PVector bottomRight3 = new PVector(bottomRight2.x, bottomRight2.y);
    topLeft3.add(padding);
    topLeft3.add(shift);
    topRight3.add(padding);
    topRight3.add(shift);
    bottomLeft3.add(padding);
    bottomLeft3.add(shift);
    bottomRight3.add(padding);
    bottomRight3.add(shift);
    nr4 = new NumberRect(topLeft3, topRight3, bottomLeft3, bottomRight3);

    PVector topLeft4 = new PVector(topLeft3.x, topLeft3.y);
    PVector topRight4 = new PVector(topRight3.x, topRight3.y);
    PVector bottomLeft4 = new PVector(bottomLeft3.x, bottomLeft3.y);
    PVector bottomRight4 = new PVector(bottomRight3.x, bottomRight3.y);
    topLeft4.add(padding);
    topLeft4.add(shift);
    topRight4.add(padding);
    topRight4.add(shift);
    bottomLeft4.add(padding);
    bottomLeft4.add(shift);
    bottomRight4.add(padding);
    bottomRight4.add(shift);
    nr5 = new NumberRect(topLeft4, topRight4, bottomLeft4, bottomRight4);

    PVector topLeft5 = new PVector(topLeft4.x, topLeft4.y);
    PVector topRight5 = new PVector(topRight4.x, topRight4.y);
    PVector bottomLeft5 = new PVector(bottomLeft4.x, bottomLeft4.y);
    PVector bottomRight5 = new PVector(bottomRight4.x, bottomRight4.y);
    topLeft5.add(padding);
    topLeft5.add(shift);
    topRight5.add(padding);
    topRight5.add(shift);
    bottomLeft5.add(padding);
    bottomLeft5.add(shift);
    bottomRight5.add(padding);
    bottomRight5.add(shift);
    nr6 = new NumberRect(topLeft5, topRight5, bottomLeft5, bottomRight5);
  }
  
  theBackground = createGraphics(width, 350);
  theTextBackground = createGraphics(width, 50);
  
  frameRate(10);
}


void draw()
{
  if (lr.advance() == false)
  {
    noLoop();
  }

  stroke(88);
  
  theBackground.beginDraw();
  theBackground.background(55, 12);
  
  nr1.display(int(lr.getFirstNumber()));
  nr2.display(int(lr.getSecondNumber()));
  nr3.display(int(lr.getThirdNumber()));
  nr4.display(int(lr.getFourthNumber()));
  nr5.display(int(lr.getFifthNumber()));
  nr6.display(int(lr.getSixthNumber()));
  
  theBackground.endDraw();
  image(theBackground, 0, 0);
  
  theTextBackground.beginDraw();
  theTextBackground.background(44, 255);
  image(theTextBackground, 0, 352);
  
  String textStr = 
    r.getDrawingDate() + "  :  " + r.getFirstNumber() + "   " +
    r.getSecondNumber() + "   " + r.getThirdNumber() + "   " +
    r.getFourthNumber() + "  " + r.getFifthNumber() + "   " +
    r.getSixthNumber();
  textSize(18);
  text(textStr, 230, 380);
  
  theTextBackground.endDraw();
}

void keyPressed()
{
  if (loop)
  {
    loop = false;
    loop();
  }
  else
  {
    loop = true;
    noLoop();
  }
}
