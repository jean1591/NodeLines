

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

  public Trait(Noeud start, Noeud end) {
    this.xStart = start.xPos;
    this.yStart = start.yPos;
    this.xEnd = end.xPos;
    this.yEnd = end.yPos;
  }

  // Accesseurs
  public int getXStart() {
    return this.xStart;
  }

  public int getYStart() {
    return this.yStart;
  }

  public int getXEnd() {
    return this.xEnd;
  }

  public int getYEnd() {
    return this.yEnd;
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
    stroke(255);
    line(this.xStart, this.yStart, this.xEnd, this.yEnd);
  }

  public void deplacerTrait(Noeud nStart, Noeud nEnd) {
    setXStart(nStart.getXPos());
    setYStart(nStart.getYPos());
    setXEnd(nEnd.getXPos());
    setYEnd(nEnd.getYPos());
  }

  public boolean isEquals(Trait t) {
    return (this.xStart == t.getXStart() &&
      this.yStart == t.getYStart() &&
      this.xEnd == t.getXEnd() &&
      this.yEnd == t.getYStart());
  }
}
