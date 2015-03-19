class Game implements Serializable{
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
    isDead();
    showHP();
  }
  void addProjectile(Projectile p) {
    projectiles.add(p);
  }  
  void isDead() {
    int e = 0;
    if (pik != null || cha != null) { 
      if (pik.isUnconscious()) {
        textSize(115);
        fill(255, 0, 0);
        text("Charmander Wins!", 30, 360);
        while (e<10) {
          cha.jump();
          e++;
        }
      } else if (cha.isUnconscious()) {
        textSize(115);
        fill(#ffff26);
        text("Pikachu Wins!", 120, 360);
        while (e<10) {
          pik.jump();
          e++;
        }
      }
    }
  }
  void updateAllProjectiles() {
    for (int i = 0; i < projectiles.size (); i++) {
      Projectile p = projectiles.get(i);
      p.update();
      if (cha.hitTest(p) == true) {
        cha.jump();
        projectiles.remove(i);
        cha.loseHP();
      } else if (pik.hitTest(p) == true) {
        pik.jump();
        projectiles.remove(i);

        pik.loseHP();
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

  void showHP() {
    textSize(100);
    fill(255, 0, 0);
    text(cha.currentHP, 900, 100);
    fill(#ffff26);
    text(pik.currentHP, 10, 100);
  }



  Pikachu getPikachu() {
    return pik;
  }
  Charmander getCharmander() {
    return cha;
  }
  
  void saveState(){
    println("saving...");
    PrintWriter output = createWriter("savedState.txt");
    output.println("pik:" + TAB + "" + pik.x + "" + TAB + "" + pik.y);
    output.println("cha:" + TAB + "" + cha.x + "" + TAB + "" + cha.y);
    output.flush();
    output.close();
  }
  void loadState(){
    println("loading save...");
    BufferedReader reader = createReader("savedState.txt");
    String line;
    try {
      while((line = reader.readLine()) != null){
        String[] pieces = split(line, TAB);
        if(pieces[0].equals("pik:")){
          pik.x = float(pieces[1]);
          pik.y = float(pieces[2]);
        } else if(pieces[0].equals("cha:")){
          cha.x = float(pieces[1]);
          cha.y = float(pieces[2]);
        }
      }
    } catch (IOException e) {
    println("IOException :(");
    }
  }
  
}

