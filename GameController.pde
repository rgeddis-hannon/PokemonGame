class Game {
  ArrayList<Projectile> projectiles;
  Pikachu pik;
  Charmander cha;
  //ArrayList<Platform> platforms;


  Game() {
    pik = new Pikachu(this);
    cha = new Charmander(this);
    projectiles = new ArrayList<Projectile>();
  }

  void tick() {
    updateAllProjectiles();
    drawAllProjectiles();
    updateAllPokemon();
    drawAllPokemon();
  }
  void addProjectile(Projectile p) {
    projectiles.add(p);
  }  
  void updateAllProjectiles() {
    for (int i = 0; i < projectiles.size (); i++) {
      Projectile p = projectiles.get(i);
      p.update();
      if (cha.hitTest(p) == true) {
        //p.currentHP--;
        cha.jump();
        projectiles.remove(i);
        println("you have been hit!");
      } else if (projectiles.get(i).getX() > width || projectiles.get(i).getX() < 0) {
        projectiles.remove(i);
      }
    }
  }
  void drawAllProjectiles() {
    for (int i = 0; i < projectiles.size (); i++) {
      Projectile p = projectiles.get(i);
      p.drawSelf();
    }
  }

  void updateAllPokemon() {
    if (cha != null && pik != null) {
      moveLR();
      jump();
      cha.wrap();
      pik.wrap();
      cha.updatePosition();
      pik.updatePosition();
    }
  }

  void drawAllPokemon() {
    if (cha != null && pik != null) {
      pik.drawSelf();
      cha.drawSelf();
    }
  }

  Pikachu getPikachu() {
    return pik;
  }
  Charmander getCharmander() {
    return cha;
  }
}

