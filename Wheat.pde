class Wheat extends Plant {
  
  int stemLength;
  int stemThickness;
  int leafNum;
  
  Wheat (String name) {
    super(name);
    stemLength = 0;
    this.name = name;
    this.dying = false;
    this.growthFactor = 0.1;
    this.leafNum = 0;
    this.leaves = new ArrayList<Leaf>();    
  }
  
  void grow () {
    textSize(32);
    fill(255);
    text(name, 40, 60);
    
    if(!dying && time != 0) {
    if (f > 4 && s < 1 && w < 1){
      death();
      }
    else if (w < 2 && s > 3){
      death();
      }
    else if (f > 4 && w < 1 && s < 1){
      death();
      }
    }
 
    
    
    
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
