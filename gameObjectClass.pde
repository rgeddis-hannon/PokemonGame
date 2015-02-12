abstract class GameObject {
  float x, y;
  int wid, hei;
  PImage imgSrc;
  String direction = "none";
  
  int getWid(){
    return wid;
  }
  int getHei(){
    return hei;
  }
  float getX(){
    return x;
  }
  float getY(){
    return y;
  }
  
  boolean hitTest(GameObject otherObj){

    //check X collision
    if(this.getX()+float(this.getWid()) >= otherObj.getX() 
      && this.getX() <= otherObj.getX() + float(otherObj.getWid())){
      //check Y collision
      if(this.getY()+float(this.getHei())  >= otherObj.getY() 
        && this.getY() <= otherObj.getY() + float(otherObj.getHei())){
        return true;
      }
    }
    return false;
  }
  void drawSelf() {
        pushMatrix();
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
