class Sunflower extends Plant {
  ArrayList<Leaf> leaves;
  int stemLength;
  int stemThickness;
  Sunflower(String name) {
    super(name);
    this.name = name;
    this.dying = false;
    this.rangeS = 4;
    this.rangeF = 4;
    this.rangeW = 4;
    this.growthFactor = 2.0;
    this.leaves = new ArrayList<Leaf>();
  }
  void grow() {
    textSize(128);
    fill(255);
    text(name, 40, 120);
    dying = time > 400;
    if(dying) {
      time = 800-time;
      foilage = color(127, 127, 0);
    } else {
      foilage = color(127, 255, 0);
    }
    stemLength = time;
    stemThickness = 2+(time/50);
    fill(foilage);
    rect(midX-stemThickness,groundLevel,stemThickness*2,-stemLength);
    if(time > 300) {
      fill(63, 31, 0);
      circle(midX,groundLevel-stemLength,time/2-100);
    } else if(time > 200) {
      fill(foilage);
      circle(midX,groundLevel-stemLength,time/2-100);
    }
    if(dying) {
      time = 800-time;
    }
    time++;
  }
}
