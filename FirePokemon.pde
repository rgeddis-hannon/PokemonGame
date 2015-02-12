class Charmander extends Pokemon {
  
  
  Charmander(Game g) {
    wid = 250;
    hei = 250;
    currentHP=50;
    imgSrc = loadImage("http://cdn.bulbagarden.net/upload/thumb/7/73/004Charmander.png/250px-004Charmander.png");
}
  
  void attack() {
    Fireball f = new Fireball(x, y, direction); 
    g.addProjectile(f);
  }
    void Cdead(){
    if (currentHP <= 0){
      tint(255, 126);  
      }
    }
}
