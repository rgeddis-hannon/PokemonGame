class Charmander extends Pokemon {
  
  
  Charmander(Game g) {
    println("Charmander initialized!");
    wid = 250;
    hei = 250;
    imgSrc = loadImage("http://cdn.bulbagarden.net/upload/thumb/7/73/004Charmander.png/250px-004Charmander.png");
  }
  
  void attack() {
    println("fffffffire!");
    Fireball f = new Fireball(); 
    g.addProjectile(f);
  }
  
}
