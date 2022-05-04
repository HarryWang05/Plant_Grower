class Tomato extends Plant {
  ArrayList<Leaf> leaves;
  int stemLength;
  int stemThickness;
  Tomato(String name) {
    super(name);
    stemLength = 0;
    this.name = name;
    this.dying = false;
    this.leaves = new ArrayList<Leaf>();
  }

  void grow () {
    dying = this.time > 200;
    if(dying) {
      time = 800-time;
      this.foliage = color(124,252,0);
    } else {
      this.foliage = color(255, 99, 71);
    }
    stemLength = time;
    stemThickness = 2+(time/50);
    fill(foliage);
    rect(midX-stemThickness,groundLevel,stemThickness*2,-stemLength);
    if(time > 300) {
      fill(255, 0, 0);
      circle(midX,groundLevel-stemLength,time/2-100);
    } else if(time > 200) {
      fill(foliage);
      circle(midX,groundLevel-stemLength,time/2-100);
    }
    if(dying) {
      time = 800-time;
    }
    time++;
  }
    
 }
