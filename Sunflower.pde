class Sunflower extends Plant {
  int stemLength;
  int stemThickness;
  int leafNum;
  Sunflower(String name) {
    super(name);
    this.name = name;
    this.lifespan = 400;
    this.dying = false;
    this.rangeS = 4;
    this.rangeF = 4;
    this.rangeW = 4;
    this.growthFactor = 2.0;
    this.leafNum = 0;
    this.leaves = new ArrayList<Leaf>();
  }
  void grow() {
    //Name of plant
    textSize(32);
    fill(255);
    text(name, 40, 60);
    dying = time > 400;
    
    // Attributes based on dying or not
    if(dying) {
      time = 800-time;
      foilage = color(127, 127, 0);
      flowerFoilage = color(191, 191, 0);
    } else {
      foilage = color(127, 255, 0);
      flowerFoilage = color(255, 255, 0);
    }
    
    // Render and create new leaves
    if(stemLength > (leafNum+1)*100) {
      leaves.add(new Leaf(600-(leafNum+2)*100,-PI/6,0.5,this));
      leaves.add(new Leaf(600-(leafNum+2)*100,-5*PI/6,0.5,this));
      leafNum++;
    }
    for(int i = 0; i < leaves.size(); i++) {
      leaves.get(i).grow();
    }
    
    // Render stem and flower
    stemLength = time;
    stemThickness = 2+(time/50);
    fill(foilage);
    rect(midX-stemThickness,groundLevel,stemThickness*2,-stemLength);
    if(time > 300) {
      fill(flowerFoilage);
      pushMatrix();
      translate(midX,groundLevel-stemLength);
      for(int i = 0; i < 16; i++) {
        rotate(i*PI/8);
        ellipse(time/4-50,0,time/15,time/20);
      }
      popMatrix();
      fill(63, 31, 0);
      circle(midX,groundLevel-stemLength,time/2-100);
    } else if(time > 200) {
      fill(foilage);
      circle(midX,groundLevel-stemLength,time/2-100);
    }
    if(dying) {
      if(time <= 0) {
        plants.remove(plants.indexOf(this));
      }
      time = 800-time;
    }
    time++;
  }
}