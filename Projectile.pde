abstract class Projectile extends GameObject {
  float vel;
  float damage;
  float grav;
  abstract void update();
}


class Fireball extends Projectile {
  color col;
  Fireball(float startX, float startY, String startDir) {
    x = startX;
    y = startY + 125;
    grav =1;
    if (startDir.equals("left")) {
      vel = -25.5;
    } else {
      vel = 25.5;
    }
    col = color(255,0,0); 
  }
    void update() {
    x = x + vel;
    y =y + grav;
  }
  void drawSelf() {
    fill(col);
    ellipse(x, y, 20, 20);
  }
}
class Bolt extends Projectile{
  color col;
  Bolt(float startX, float startY, String startDir) {
    x = startX;
    y = startY + 125;
    if (startDir.equals("left")) {
      vel = -25.5;
    } else {
      vel = 25.5;
    }
    col = color(#ffff26); 
  }
  void update() {
    x = x + vel;
  }
  void drawSelf() {
    fill(col);
    ellipse(x, y, 20, 20);
  }
}
class Wave extends Projectile{
 color col;
  Wave() {
    damage = random (15,30);
    col = color(#0000ff); 
  }
  void update() {
  }
  void drawSelf() {
    fill(col);
    ellipse(x, y, 20, 20);
  }
}

