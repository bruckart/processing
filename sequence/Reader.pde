

class Reader
{
  private String   theNumbersFile;

  private int      theIndex = 0;
  private String[] theLines;

  // HashMap<String, String> theData = new HashMap<String,String>();
  StringList theData = new StringList();

  Reader(String numbersFile)
  {
    theNumbersFile = numbersFile; 
    theLines       = loadStrings(theNumbersFile);

    for (int i = 0 ; i < theLines.length; i++)
    {
      theData.append(theLines[i]);
    }
  }

  public boolean advance()
  {
    if (theIndex < theData.size()-1)
    {
      theIndex++;
      return true;
    }
    else
    {
      return false;
    }
  }

  public int currentIndex()
  {
    return theIndex;
  }
  public int indexSize()
  {
    return theData.size();
  }
  
  public String getDrawingDate()
  {
    System.out.println("theIndex=" + theIndex);
    System.out.println("theData.size()=" + theData.size());
    
    String str = theData.get(theIndex);
    String[] parts = str.split("    ");
    return parts[0];
  }
  public String getFirstNumber()
  {
    String str = theData.get(theIndex);
    String[] parts = str.split("    ");
    
    String num = parts[1];
    String[] tokens = num.split(" ");
    return tokens[0].replace(",", "");
  }
  public String getSecondNumber()
  {
    String str = theData.get(theIndex);
    String[] parts = str.split("    ");
    
    String num = parts[1];
    String[] tokens = num.split(" ");
    return tokens[1].replace(",", "");
  }
  public String getThirdNumber()
  {
    String str = theData.get(theIndex);
    String[] parts = str.split("    ");
    
    String num = parts[1];
    String[] tokens = num.split(" ");
    return tokens[2].replace(",", "");
  }
  public String getFourthNumber()
  {
    String str = theData.get(theIndex);
    String[] parts = str.split("    ");
    
    String num = parts[1];
    String[] tokens = num.split(" ");
    return tokens[3].replace(",", "");
  }
  public String getFifthNumber()
  {
    String str = theData.get(theIndex);
    String[] parts = str.split("    ");
    
    String num = parts[1];
    String[] tokens = num.split(" ");
    return tokens[4].replace(",", "");
  }
  public String getSixthNumber()
  {
    String str = theData.get(theIndex);
    String[] parts = str.split("    ");
    
    String num = parts[1];
    String[] tokens = num.split(" ");
    return tokens[5].replace(",", "");
  }
};
