class Leaf {
  int leafHeight, leafWidth;
  int time;
  int posY;
  float sizeFactor;
  float angle;
  Plant stem;
  Leaf(int posY, float angle, float sizeFactor, Plant stem) {
    this.posY = posY;
    this.sizeFactor = sizeFactor;
    this.angle = angle;
    this.stem = stem;
    this.time = 0;
  }
  void grow() {
    //Grows at y-position
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
    fill(stem.foilage);
    pushMatrix();
    translate(midX,posY);
    rotate(angle);
    ellipse(0+leafWidth/2,0,leafWidth,leafHeight);
    popMatrix();
    if(stem.time < stem.lifespan || stem.dying) {
      time += stem.growth();
    }
  }
}
