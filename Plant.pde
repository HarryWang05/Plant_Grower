class Plant {
  
  // Fields
  ArrayList<Leaf> leaves;
  String name;
  int time;
  float exactTime;
  int lifespan;
  float sun, fertilizer, water;
  float rangeS, rangeF, rangeW, growthFactor;
  boolean dying;
  color foliage;
  color flowerFoliage;
  
  // Constructor
  Plant(String name) {
    this.time = 0;
    this.exactTime = 0;
    this.name = name;
  }
  
  // Determines growth based on sunlight, water, and fertilizer, and the plant's needs
  float growth() {
    float growths = 0;
    growths += growthFactor * (rangeS - pow((s - sqrt(rangeS)),2.0));
    growths += growthFactor * (rangeF - pow((f - sqrt(rangeF)),2.0));
    growths += growthFactor * (rangeW - pow((w - sqrt(rangeW)),2.0));
    if(growths < 0) {
      return 0;
    }
    return growths;
  }
  
  // Emtpy methods to be used by classes that extend Plant
  void grow() {
  }
  void death() {
  }
}
