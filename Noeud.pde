
public class Noeud {
  // Attributs
  private int xPos;
  private int yPos;
  private int xDep;
  private int yDep;
  private int noeudSize;
  private ArrayList<Trait> traits = new ArrayList<Trait>();

  // Constructeurs
  public Noeud(int noeudSize) {
    /*
     * Constructeur simple
     * Les positions et les deplacements sont aleatoires
     */
    this.xPos = (int) random(10, 791);
    this.yPos = (int) random(10, 791);
    this.xDep = 0;
    this.yDep = 0;
    this.noeudSize = noeudSize;

    // Impossible d'avoir xDep ou yDep a 0
    while (this.xDep == 0) {
      this.xDep = (int) random(-2, 3);
    }
    while (this.yDep == 0) {
      this.yDep = (int) random(-2, 3);
    }
  }
  
    public Noeud(int xPos, int yPos, int noeudSize) {
    /*
     * Constructeur utilisateur
     * Les positions sont définies par l'utilisateur
     * Les deplacements sont aleatoires
     */
    this.xPos = xPos;
    this.yPos = yPos;
    this.xDep = 0;
    this.yDep = 0;
    this.noeudSize = noeudSize;

    // Impossible d'avoir xDep ou yDep a 0
    while (this.xDep == 0) {
      this.xDep = (int) random(-2, 3);
    }
    while (this.yDep == 0) {
      this.yDep = (int) random(-2, 3);
    }
  }

  // Accesseurs
  public int getXPos() {
    return this.xPos;
  }

  public int getYPos() {
    return this.yPos;
  }

  // Mutateurs
  public void setXPos(int xDep) {
    this.xPos += xDep;
  }

  public void setYPos(int yDep) {
    this.yPos += yDep;
  }

  public void setNoeudSize() {
    this.noeudSize = ELLIPSE_SIZE + (traits.size() * 4);
  }

  // Methodes
  public void dessinerNoeud() {
    /*
     * Dessine un Noeud
     */
    ellipse(this.xPos, this.yPos, this.noeudSize, this.noeudSize);
  }

  public void lierNoeudsProches(ArrayList<Noeud> noeuds) {
    this.resetTraits();
    for (Noeud n : noeuds) {
      if (dist(this.xPos, this.yPos, n.getXPos(), n.getYPos()) <= 300) {
        Trait t = new Trait(this, n);
        t.dessinerTrait();
        traits.add(t);
      }
      this.setNoeudSize();
    }
  }

  public void deplacerNoeud() {
    /*
     * Deplace le Noeud selon les valeurs de xDep et yDep
     * L'objet rebondi contre les bords de la fenetre
     */

    if (this.xPos <= 0 || this.xPos >= 800) {
      this.xDep = -this.xDep;
    }
    if (this.yPos <= 0 || this.yPos >= 800) {
      this.yDep = -this.yDep;
    }

    this.setXPos(this.xDep);
    this.setYPos(this.yDep);
  }

  public boolean isEquals(Noeud n) {
    return (this.xPos == n.getXPos() && this.yPos == n.getYPos());
  }

  public void resetTraits() {
    this.traits.clear();
  }
  
  public boolean contientPointeur() {
    return (dist(this.xPos, this.yPos, mouseX, mouseY) <= this.noeudSize/2);
  }
}
