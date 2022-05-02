class Plant {
  ArrayList<Leaf> leaves;
  String name;
  int time;
  float exactTime;
  int lifespan;
  float sun, fertilizer, water;
  float rangeS, rangeF, rangeW, growthFactor;
  boolean dying;
  color foilage;
  color flowerFoilage;
  Plant(String name) {
    this.time = 0;
    this.exactTime = 0;
    this.name = name;
  }
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
  void grow() {
  }
  void death() {
  }
}
