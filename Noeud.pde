
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
     * Les positions  et les deplacements sont aleatoires
     */
    this.xPos = (int) random(10, 791);
    this.yPos = (int) random(10, 791);
    this.xDep = 0;
    this.yDep = 0;
    this.noeudSize = noeudSize;

    // Impossible d'avoir xDep ou yDep a 0
    while (this.xDep == 0) {
      this.xDep = (int) random(-3, 4);
    }
    while (this.yDep == 0) {
      this.yDep = (int) random(-3, 4);
    }
  }

  // Accesseurs
  public int getXPos() {
    return this.xPos;
  }

  public int getYPos() {
    return this.yPos;
  }

  // Mutateur
  public void setXPos(int xDep) {
    this.xPos += xDep;
  }

  public void setYPos(int yDep) {
    this.yPos += yDep;
  }

  // Methodes
  public void dessinerNoeud() {
    /*
     * Dessine un Noeud
     */
    ellipse(this.xPos, this.yPos, this.noeudSize, this.noeudSize);
  }

  public void lierNoeudsProches(ArrayList<Noeud> noeuds) {
    for (Noeud n : noeuds) {
      if (dist(this.xPos, this.yPos, n.getXPos(), n.getYPos()) <= 200) {
        Trait t = new Trait(this.xPos, this.yPos, n.getXPos(), n.getYPos());
        t.dessinerTrait();
      }
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
}
