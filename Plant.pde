class Plant {
  int plantness;
  int time;
  boolean dying;
  color foilage;
  Plant(int p) {
    plantness = p;
    time = 0;
  }
}

class Sunflower extends Plant {
  int stemLength;
  int stemThickness;
  Sunflower(int p) {
    super(p);
    plantness = p;
    stemLength = 0;
    stemThickness = 5;
    dying = false;
  }
  void grow() {
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

class Tomato extends Plant {
  int stemLength;
  Tomato(int p) {
    super(p);
    plantness = p;
    stemLength = 0;
  }
}
