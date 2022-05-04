class Wheat extends Plant {
  
  // Fields
  int stemLength;
  int stemThickness;
  int leafNum;
  
  // Constructor
  Wheat(String name) {
    super(name);
    this.name = name;
    this.lifespan = 400;
    this.dying = false;
    this.rangeS = 4;
    this.rangeF = 4;
    this.rangeW = 4;
    this.growthFactor = 0.1;
    this.leafNum = 0;
    this.leaves = new ArrayList<Leaf>();
  }
  
  // Render and grow plant
  void grow() {
    
    // Name of plant
    textSize(32);
    fill(255);
    text(name, 40, 60);
    
    
    // Plant dying instances 
    if(!dying && time != 0) {
      if (f > 4 && s < 1 && w < 1){
        death();
      }
      else if (w > 4 && s < 1){
        death();
      }
      else if (s > 4 && w < 1){
        death();
      }
    }
    
    // Attributes based on dying or not
    if(dying) {
      time = lifespan*2-time;
      foliage = color(127, 127, 0);
      flowerFoliage = color(191, 191, 0);
    } else {
      foliage = color(151, 135, 12);
      flowerFoliage = color(255,255,0);
    }
    
    // Render and create new leaves
    if(stemLength > (leafNum+1)*50) {
      leaves.add(new Leaf(midX,groundLevel-(leafNum+1)*50,-2*PI/6,0.3,this));
      leaves.add(new Leaf(midX,groundLevel-(leafNum+1)*50,-5*PI/6,0.3,this));
      leaves.add(new Leaf(midX,groundLevel-(leafNum+1)*50,-6*PI/6,0.3,this));
      leafNum++;
    }
    for(int i = 0; i < leaves.size(); i++) {
        leaves.get(i).grow();
    }
    
    // Render stem and flower
    stemLength = time;
    stemThickness = 2+(time/70);
    fill(foliage);
    rect(midX-stemThickness,groundLevel,stemThickness,-stemLength);
    
    // Check to see if plant has ceased to exist
    if(dying) {
      if(time <= 0) {
        //plants.remove(plants.indexOf(this));
        plants[plantIndex] = null;
      }
      time = lifespan*2-time;
    }
    
    // Only grow based on environment if living
    if(time < lifespan){
      exactTime += growth();
    } else if(dying) {
      exactTime++;
    }
    
    // exactTime is used to keep a more percise value of time, in case values less than 1 are added
    time = round(exactTime);
  }
  
  // Called when the plant starts dying
  void death() {
    lifespan = time;
    dying = true;
  }
}
