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


  float getXVel(){
  return xVel;
  }


  void loseHP(){
    currentHP = currentHP - 1;
    
  }

  boolean isUnconscious() {
    return currentHP <= 0;
  }
  
  void drawSelf() {
    pushMatrix();
    if (currentHP <= 0){
      tint(255, 126);
      rotate(.5);
     }
     else {
        noTint(); 
     }

      if (direction =="left") {
          scale(1.0, 1.0);
          image(imgSrc, x, y);
      } else  if(direction == "right"){
          scale(-1.0, 1.0);
          image(imgSrc, -x - imgSrc.width, y);
      } else {
        scale(1.0, 1.0);
        image(imgSrc, x, y);
      }
      popMatrix();
  }

}
