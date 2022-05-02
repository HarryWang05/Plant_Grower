import g4p_controls.*;

//ArrayList<Plant> plants = new ArrayList<Plant>();
Plant[] plants = new Plant[12];
Sunflower hi = new Sunflower("Hi");
int midX = 300;
int groundLevel = 500;
int whichPlant = 0;
float s, w, f;
boolean p;
boolean running = true;

void setup() {
  size(600,600);
  createGUI();
  addNewPlantsWindow.setVisible(false);
  for(int i = 0; i < 12; i++) {
    //plants.add(new Sunflower("sunflower"+i));
    plants[i] = new Sunflower("sunflower"+i);
  }
}

void draw() {
  //plants.get(whichPlant).grow();
  if(running) {
    background(0);
    if(plants[whichPlant] != null) {
      plants[whichPlant].grow();
    }
  }
}
