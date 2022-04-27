class Plant  {
  String name;
  int time;
  float rangeS, rangeF, rangeW, growthFactor;
  boolean dying;
  int foliageR;
  int foliageG;
  int foliageB;
  float maxHeight;
  Plant(String n, float mh, float gf) {
    this.time = 0;
    this.name = n;
    this.maxHeight = mh;
    this.dying = false;
    this.growthFactor = gf;
  }
  float growth() {
    int growths = 0;
    growths += 9- growthFactor *(sq(0.65*fertilizer.getValueF()));
    growths += 5 - growthFactor * (sq(.9 * water.getValueF()));
    growths += 5 - growthFactor * 3 * sin(sunlight.getValueF());
    if(growths<0){
      dying = true;
    
    }
    return growths;
    
  }
  void grow() {
    textSize(128);
    fill(255);
    text(this.name, 40, 120);
    
  }
}
