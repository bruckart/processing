

ArrayList<Box>       boxes = new ArrayList<Box>();
ArrayList<Mask>      inactiveMasks = new ArrayList<Mask>();
ArrayList<Mask>      activeMasks = new ArrayList<Mask>();

void activate()
{
  if (inactiveMasks.isEmpty()) { return; }

  int idx = (int) random(0, inactiveMasks.size());
  Mask m = inactiveMasks.get(idx);
  inactiveMasks.remove(idx);
  activeMasks.add(m);
}

void setup()
{
  size(493, 800);
  background(23);

  { // boxes /////////////////////////////////////////////////////////
    for (int x = 0; x <= width+128; x+=130)
    {
      for (int y = 0; y <= height+50; y+=220)
      { 
        pushStyle();
        stroke(#4DA6AA);
        strokeWeight(3);
        point(x, y);
        popStyle();
        Box b = new Box(x, y);
        boxes.add(b);
      }
    }
  
    for (int x = 65; x <= width; x+=130)
    {
      for (int y = 110; y <= height; y+=220)
      {
        Box b = new Box(x, y);
        boxes.add(b);
      }
    }
  }

  { // masks /////////////////////////////////////////////////////////
    for (int x = -65; x <= width+128; x+=130)
    {
      for (int y = -40; y <= height+50; y+=220)
      { 
        Mask m = new Mask(x, y);
        inactiveMasks.add(m);
      }
    }
  
    for (int x = -130; x <= width+128; x+=130)
    {
      for (int y = 70; y <= height+50; y+=220)
      { 
        Mask m = new Mask(x, y);
        inactiveMasks.add(m);
      }
    }
  }
  activate();
  
  smooth(); // like a baby
}

void draw()
{
  background(36);

  for (int i = 0; i < boxes.size(); i++)
  {
    boxes.get(i).display();
  }
  for (int i = 0; i < activeMasks.size(); i++)
  {
    activeMasks.get(i).display();
  }
}

void mouseClicked()
{
  activate();
}
