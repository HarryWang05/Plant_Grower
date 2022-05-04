class Leaf {
  
  // Fields
  int leafHeight, leafWidth;
  int time;
  float exactTime;
  int posX;
  int posY;
  float sizeFactor;
  float angle;
  Plant stem;
  
  // Constructor
  Leaf(int posX, int posY, float angle, float sizeFactor, Plant stem) {
    this.posX = posX;
    this.posY = posY;
    this.sizeFactor = sizeFactor;
    this.angle = angle;
    this.stem = stem;
    this.time = 0;
    this.exactTime = 0;
  }
  
  //Render and grow leaf
  void grow() {
    //Grows at y-position and at angle given
    if(stem.dying) {
      posY++;
      leafHeight--;
      if(leafHeight <= 0) {
        println(stem.leaves.indexOf(this));
        stem.leaves.remove(stem.leaves.indexOf(this));
        return;
      }
    } else {
      leafWidth = int(time*sizeFactor);
      leafHeight = int(time/2*sizeFactor);
    }
    fill(stem.foliage);
    // pushMatrix to rotate around the x and y position given
    pushMatrix();
    translate(posX,posY);
    rotate(angle);
    ellipse(0+leafWidth/2,0,leafWidth,leafHeight);
    popMatrix();
    // If the plant is growing, the leaf will grow too
    if(stem.time < stem.lifespan) {
      // Growth depends on plant growth
      exactTime += stem.growth();
      time = round(exactTime);
    }
  }
}
