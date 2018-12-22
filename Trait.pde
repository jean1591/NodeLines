

public class Trait {
  // Attributs
  int xStart;
  int yStart;
  int xEnd;
  int yEnd;
  
  // Constructeurs
  public Trait(int xStart, int yStart, int xEnd, int yEnd) {
    this.xStart = xStart;
    this.yStart = yStart;
    this.xEnd = xEnd;
    this.yEnd = yEnd;
  }
  
  // Mutateurs
  public void setXStart(int xStart) {
    this.xStart = xStart;
  }
  
  public void setYStart(int yStart) {
    this.yStart = yStart;
  }
  
  public void setXEnd(int xEnd) {
    this.xEnd = xEnd;
  }
  
  public void setYEnd(int yEnd) {
    this.yEnd = yEnd;
  }
  
  // Methodes
  public void dessinerTrait() {
    line(this.xStart, this.yStart, this.xEnd, this.yEnd);
  }
  
  public void deplacerTrait(Noeud nStart, Noeud nEnd) {
    setXStart(nStart.getXPos());
    setYStart(nStart.getYPos());
    setXEnd(nEnd.getXPos());
    setYEnd(nEnd.getYPos());
  }
}
