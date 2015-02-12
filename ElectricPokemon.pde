class Pikachu extends Pokemon {
  
  
  Pikachu(Game g) {
    wid = 250;
    hei = 250;
    currentHP = 50;
    imgSrc = loadImage("http://cdn.bulbagarden.net/upload/thumb/0/0d/025Pikachu.png/250px-025Pikachu.png");

  }
  void attack() {
    Bolt b = new Bolt(x, y, direction); 
    g.addProjectile(b);
  }

}
