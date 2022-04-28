class Plant  {
  String name;
  int time;
  float rangeS, rangeF, rangeW, growthFactor;
  boolean dying;
  int foliageR;
  int foliageG;
  int foliageB;
  float maxHeight;
  float stemLength;
  Plant(String n, float mh, float gf, int fR, int fG, int fB) {
    this.time = 0;
    this.name = n;
    this.maxHeight = mh;
    this.dying = false;
    this.growthFactor = gf;
    this.stemLength = 0;
    this.foliageR = fR;
    this.foliageG = fG;
    this.foliageB = fB;
  }
  float growth() {
    int growths = 0;
    growths += 9- growthFactor *(sq(0.65*fertilizer.getValueF()));
    growths += 5 - growthFactor * (sq(.9 * water.getValueF()));
    growths += 5 - growthFactor * 3 * sin((PI * 2 * sunlight.getValueF())/360);
    if(growths<0){
      this.dying = true;
    
    }
    return growths;
    
  }
  void grow() {
    textSize(40);
    fill(255);
    text(this.name, 40, 120);
    if(this.dying){
      if(foliageR < 79) foliageR +=1;
      
    } else {
      if(foliageR > 40) foliageR -=1;
    
    } 
    if( (this.stemLength + growth()) > 0) {
      this.stemLength += growth();
    } else { 
      this.stemLength = 0;
    }
    
    
    
  }
}
