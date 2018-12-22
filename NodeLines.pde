

// Constantes
int ELLIPSE_SIZE = 20;

// 
ArrayList<Noeud> noeuds = new ArrayList<Noeud>();


public void setup() {
  size(800, 800);
  creerNNoeuds(15);
}

public void draw() {
  background(100);
  dessinerNoeuds();
  dessinerTraits();
  
  for (Noeud n: noeuds) {
    n.deplacerNoeud();
  }
}

public void creerNNoeuds(int n) {
  /*
   * Crée n objets Noeud
   */
  for (int i=0; i<n; i++) {
    noeuds.add(new Noeud(ELLIPSE_SIZE));
  }
}

public void dessinerNoeuds() {
  /*
   * Dessine les objets Noeud contenus dans l'ArrayList noeuds
   */
  for (Noeud n: noeuds) {
    n.dessinerNoeud();
  }
}

public void dessinerTraits() {
  /*
   * Parcours la liste noeuds et trace des objets Trait entre les objets Noeud ecartes de mois de 200px
   */
  for (Noeud n: noeuds) {
    n.lierNoeudsProches(noeuds);
  }
}
