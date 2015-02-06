class Game {
  ArrayList<Projectile> projectiles;
  Pikachu pik;
  Charmander cha;
  //ArrayList<Platform> platforms;
  
  
  Game(){
    pik = new Pikachu(this);
    cha = new Charmander(this);
    projectiles = new ArrayList<Projectile>();
  }
  
  void tick() {
    
    updateAllProjectiles();
    drawAllProjectiles();
    updateAllPokemon();
    drawAllPokemon();
    isDead();
  }
  void addProjectile(Projectile p) {
      projectiles.add(p);
  }  
  /*void isDead(){
    int r =0;
    if (pik != null || cha != null) { 
      if (pik.currentHP ==0) {
        pik=null;
        println("Charmander wins");
      }
       else if (cha.currentHP ==0) {
        cha=null;
        println("Pikachu wins");
       }
    } 
    
  }*/
  void updateAllProjectiles() {
    for(int i = 0; i < projectiles.size(); i++){
      Projectile p = projectiles.get(i);
      p.update();
      if(cha.hitTest(p) == true){
        cha.jump();
        projectiles.remove(i);
        println("you have been hit!");
        cha.loseHP();
       
      }
       else if(pik.hitTest(p) == true){
        pik.jump();
        projectiles.remove(i);
        println("you have been hit!");
        pik.loseHP();
      }
    }
  }
  void drawAllProjectiles() {
    for(int i = 0; i < projectiles.size(); i++){
      Projectile p = projectiles.get(i);
      p.drawSelf();
    }
  }
  
  void updateAllPokemon() {
    if (cha != null && pik != null) {
      if (pik.currentHP ==0) {
        //pikachu rotates and falls on its side 
      }
       else if (cha.currentHP ==0) {
        //charmander rotates and falls on its side
       }
    } 
     else {
      moveLR();
      jump();
      cha.wrap();
      pik.wrap();
      cha.updatePosition();
      pik.updatePosition();
     }
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
