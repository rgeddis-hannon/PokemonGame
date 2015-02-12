Game g;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

boolean wPressed = false;
boolean aPressed = false;
boolean sPressed = false;
boolean dPressed = false;

//w,a,s,d,UP,LEFT,DOWN,RIGHT.
boolean keyz[] = new boolean [8];

void setup() {
  g = new Game();
  size(1080, 720);
}

void draw() {
  background(255);
  g.tick();
  //Pokemon sometimes slide slowly (maybe triggered by attacking?)
  //println("Pikachu X-Velocity: " + g.getPikachu().getXVel());
}

void keyPressed() {
  if (key == 'w') keyz[0] = true;
  if (key == 'a') keyz[1] = true;
  if (key == 's') keyz[2] = true;
  if (key == 'd') keyz[3] = true;
  if (keyCode == UP) keyz[4] = true;
  if (keyCode == LEFT) keyz[5] = true;
  if (keyCode == DOWN) keyz[6] = true;
  if (keyCode == RIGHT) keyz[7] = true;
}

void keyReleased() {
  if (key == 'w') keyz[0] = false;
  if (key == 'a') keyz[1] = false;
  if (key == 's') keyz[2] = false;
  if (key == 'd') keyz[3] = false;
  if (keyCode == UP) keyz[4] = false;
  if (keyCode == LEFT) keyz[5] = false;
  if (keyCode == DOWN) keyz[6] = false;
  if (keyCode == RIGHT) keyz[7] = false;
}

void moveLR() {
  if (keyz[5] == true) {
    g.getPikachu().moveLeft();
  }
  if (keyz[7] == true) {
    g.getPikachu().moveRight();
  }

  if (keyz[6] == true) {
    g.getPikachu().attack();
  }

  if (keyz[1] == true) {
    g.getCharmander().moveLeft();
  }
  if (keyz[3] == true) {
    g.getCharmander().moveRight();
  }

  if (keyz[2] == true) {
    g.getCharmander().attack();
  }
}

void jump() {
  if (keyz[4] == true) {
    g.getPikachu().jump();
  }

  if (keyz[0] == true) {
    g.getCharmander().jump();
  }
}

