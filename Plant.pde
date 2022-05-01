class Plant {
  ArrayList<Leaf> leaves;
  String name;
  int time;
  int lifespan;
  float sun, fertilizer, water;
  float rangeS, rangeF, rangeW, growthFactor;
  boolean dying;
  color foilage;
  color flowerFoilage;
  Plant(String name) {
    this.time = 0;
    this.name = name;
  }
  float growth() {
    int growths = 0;
    growths += growthFactor * (rangeS - pow((sun - sqrt(rangeS)),2.0));
    growths += growthFactor * (rangeF - pow((fertilizer - sqrt(rangeF)),2.0));
    growths += growthFactor * (rangeW - pow((water - sqrt(rangeW)),2.0));
    return growths;
  }
  void grow() {
  }
}
