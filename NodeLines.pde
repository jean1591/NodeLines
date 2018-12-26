

// Constantes
int ELLIPSE_SIZE = 20;

// 
ArrayList<Noeud> noeuds = new ArrayList<Noeud>();

// Variables deplacement
boolean enMouvement = false;
Noeud noeudSelec = null;

public void setup() {
  size(800, 800);
  creerNNoeuds(5);
}

public void draw() {
  background(0);
  dessinerNoeuds();
  dessinerTraits();
  deplacerNoeuds();
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
  for (Noeud n : noeuds) {
    n.dessinerNoeud();
  }
}

public void dessinerTraits() {
  /*
   * Parcours la liste noeuds et trace des objets Trait entre les objets Noeud ecartes de moins de 200px
   */
  for (Noeud n : noeuds) {
    n.lierNoeudsProches(noeuds);
  }
}

public void deplacerNoeuds() {
  for (Noeud n : noeuds) {
    n.deplacerNoeud();
  }
}

public void mousePressed() {
  // Click gauche
  // Si pression sur bouton gauche de la souris
  if (mouseButton == LEFT) {
    for (int i=noeuds.size()-1; i>=0; i--) {
      Noeud n = noeuds.get(i);
      // Suppression du Noeud si le pointeur est sur un Noeud
      if (n.contientPointeur()) {
        noeudSelec = n;
        enMouvement = true;
      }
    }
    // Ajout de Noeud
    if (!enMouvement) {
      noeuds.add(new Noeud(mouseX, mouseY, ELLIPSE_SIZE));
    }
  }

  // Click droit
  // Si pression sur bouton droit de la souris
  else if (mouseButton == RIGHT) {
    for (int i=noeuds.size()-1; i>=0; i--) {
      Noeud n = noeuds.get(i);
      // Suppression du Noeud si le pointeur est sur un Noeud
      if (n.contientPointeur()) {
        noeuds.remove(i);
      }
    }
  }

  // Click central
  // Suppression de tous les objets Noeud si pression sur bouton central de la souris
  else if (mouseButton == CENTER) {
    resetNoeuds();
  }
}

public void mouseDragged() {
  if (enMouvement) {
    noeudSelec.deplacerNoeud(mouseX, mouseY);
  }
}

public void mouseReleased() {
  enMouvement = false;
}

public void resetNoeuds() {
  noeuds.clear();
}
