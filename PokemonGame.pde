//main pokemon abstract class, John was here
abstract class Pokemon extends GameObject{
  int currentHP;
  int maxHP;
  PImage leftImg, rightImg;
  float yVel;
  float GRAV = .5;
  float xVel;
  float xAcc;

  void moveRight() {
    direction = "right";
    xVel = xVel + 9;
    if (xVel <= 20) {  
      xAcc += 0.1;
    } else {
      xAcc = 0;
      xVel = 20;
    }
    xVel = xVel + xAcc;
  }

  void moveLeft() {
    direction = "left";
    xVel = xVel - 9;
    if (xVel >= -20) {
      xAcc -= 0.1;
    } else {
      xAcc = 0;
      xVel = -20;
    }
    xVel = xVel + xAcc;
  }

  void wrap() {
    if (x > width - 50) {
      x = -200;
    } else if (x<-200) {
      x = width - 50;
    }
  }


  void jump() {
    y -= 1;
    if (y >= height - hei - 5) {
      yVel = -10;
    }
  }
  void updatePosition() {
    if (y < height - hei) {
      y = y + yVel;
      yVel = yVel + GRAV;
    } else {
      yVel = 0;
      y = height - hei;
    }

    x = x + xVel;

    if (xVel > 0) {
      xVel = xVel - 1;
    } else if (xVel < 0) {
      xVel = xVel + 1;
    } else {
      xVel = 0;
    }
  }
  void loseHP(){
    currentHP = currentHP - 1;
    println(currentHP);
    
  }

  boolean isUnconscious() {
    return currentHP <= 0;
  }
}

